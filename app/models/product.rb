class Product < ApplicationRecord
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
end
