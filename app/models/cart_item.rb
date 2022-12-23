class CartItem < ApplicationRecord
  belongs_to :cart, touch: true

  before_commit :calculate_item_price
  after_commit :update_cart_gross_amount

  def total_price
    self.quantity * self.base_price
  end

  def variations_addons_exists?
    self.variations.present? && self.addons.present?
  end

  def variations_exists?
    self.variations.present? && self.addons.nil?
  end

  def add_ons_exists?
    self.variations.nil? && self.addons.present?
  end

  def calculate_item_price
    if variations_exists?
      base_price = variations_price
    elsif add_ons_exists?
      base_price += addons_price
    elsif variations_addons_exists?
      base_price = variations_price + addons_price
    end
  end

  def update_cart_gross_amount
    cart.update_gross_amount
  end

  private

  def variations_price
    variations["display_price"]
  end

  def addons_price
    addons.inject(0) { |sum, addon| sum + addon["display_price"] }
  end
end
