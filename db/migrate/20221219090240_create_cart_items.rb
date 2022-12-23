class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.bigint :cart_id
      t.bigint :item_id
      t.integer :quantity
      t.decimal :total_price
      t.jsonb :addons
      t.jsonb :variations
      t.decimal :base_price

      t.timestamps
    end
  end
end
