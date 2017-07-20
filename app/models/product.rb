class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  
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