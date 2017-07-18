class ChangeStockinProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :stock, :string
    add_column :products, :stock, :boolean
    change_column :products, :price, :decimal, precision: 9, scale: 2
  end
end
