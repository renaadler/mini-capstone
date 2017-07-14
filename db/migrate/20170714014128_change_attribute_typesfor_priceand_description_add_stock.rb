class ChangeAttributeTypesforPriceandDescriptionAddStock < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :description, :text
    change_column :products, :price, :decimal
    add_column :products, :stock, :string
  end
end
