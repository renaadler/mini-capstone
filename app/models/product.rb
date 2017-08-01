class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
  validates :description, length: { maximum: 500 }

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  
  def sales_method
    if price < 6 
      @message = "Discount Item!" 
    else 
      @message = "Everyday Value"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def sales_method_class_name
    if sales_method == "Discount Item!"
      return "discount-item"
    else
      return ""
    end
  end
end