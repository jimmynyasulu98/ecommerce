class AddPriceToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :price, :decimal
  end
end
