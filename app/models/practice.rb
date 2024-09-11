class Practice < ApplicationRecord
  validates :name, :street_address, :city, :phone, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
end
