class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one :address, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :email, presence: true, length: { minimum: 10, maximum: 50 },
  format: { with: /\A[a-zA-Z]+\.\d+@osu\.edu\z/i, message: "Only OSU format" }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }
  has_secure_password
end
