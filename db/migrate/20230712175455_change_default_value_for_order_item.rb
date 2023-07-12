class ChangeDefaultValueForOrderItem < ActiveRecord::Migration[7.0]
  def up
    change_column :order_items, :subtotal, :decimal, :default => 0.0
  end
end
