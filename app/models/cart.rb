class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  accepts_nested_attributes_for :cart_items, allow_destroy: true

  def update_gross_amount
    self.gross_amount = cart_items.inject(0) { |sum, cart_item| sum + cart_item.total_price }
    self.save!
  end
end
