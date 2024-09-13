class Practice < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :street_address, :city, :phone, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
end
