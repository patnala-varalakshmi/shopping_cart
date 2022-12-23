module Api
  module V1
    class CartSerializer < ActiveModel::Serializer
      attributes :id, :gross_amount

      belongs_to :user
      has_many :cart_items
    end
  end
end