class User < ActiveRecord::Base
  validates :username, presence: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 8}
  has_many :posts
  has_many :comments
  # has_secure_password
end
