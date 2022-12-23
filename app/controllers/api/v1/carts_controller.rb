module Api
  module V1
    class CartsController < ApplicationController
      before_action :set_cart

      def show
        render json: current_cart, status: 200
      end
    end
  end
end
