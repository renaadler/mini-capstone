class Image < ApplicationRecord
  belongs_to :product
  validates :url, presence: true
  # def main
  #   Image.first
  # end
end
