class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true

  belongs_to :genre
  has_one_attached :image
  has_many :cart_items
  has_many :order_details

  def with_tax_price
    (price * 1.1).floor
  end


end
