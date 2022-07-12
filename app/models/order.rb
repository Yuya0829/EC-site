class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_deposit: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }
  

  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details
  
  def with_tax_price
    (price * 1.1).floor
  end
  
end
