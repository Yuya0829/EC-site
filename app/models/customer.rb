class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :cart_items

   validates :last_name, :first_name, :last_name_kana, :first_name_kana, presence: true
   validates :email, :postal_code, :address, :telephone_number, presence: true
   validates :encrypted_password, length: { minimum: 6 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
