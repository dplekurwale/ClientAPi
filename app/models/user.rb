class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, :confirmation => true #password_confirmation attr
end