class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity,  null: false
      t.decimal :price, null: false
      t.decimal :subtotal, precision: 15, scale: 2, null: false
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
