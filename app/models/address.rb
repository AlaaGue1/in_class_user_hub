class Address < ApplicationRecord
    has_one :user

    validates :country, presence: true
    validates :zipcode, presence: true,
    format: { with: /\A\d{5}\z/, message: "Only Numbers e.g. 43210" }
    validates :city, presence: true
    validates :user_id, presence: true
end