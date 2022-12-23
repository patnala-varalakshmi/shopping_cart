module Api
  module V1
    class CartItemsController < ApplicationController
      before_action :set_cart_item, only: :remove

      def add
        if item_exists?
          @cart_item.quantity += 1
          @cart_item.total_price += @cart_item.total_price
        else
          @cart_item = current_cart.cart_items.new(set_params)
        end

        @cart_item.save!
        render json: current_cart, status: 201, serializer: CartSerializer
      end

      def remove
        if @cart_item.quantity.size > 1
          @cart_item.update!(quantity: @cart_item.quantity - 1)
        else
          @cart_item.destroy!
        end

        render json: current_cart, status: 200, serializer: CartSerializer
      end

      private

      def set_params
        params.permit(:id, :item_id, :quantity, :total_price, :addons, :variations, :base_price)
      end

      def set_cart_item
        @cart_item ||= CartItem.find(params[:id])
      end

      def item_exists?
        @cart_item = current_cart.cart_items.find_by(set_params[:item_id])
        if @cart_item && @cart_item.variations.pluck(:variation_id).include? set_params(variations[:items][:variation_id])
          return false
        else @cart_item && @cart_item.addons.pluck(:addon_id).include? set_params(addons[:items][:addon_id])
          return false
        else
          @cart_item
        end
      end
    end
  end
end
