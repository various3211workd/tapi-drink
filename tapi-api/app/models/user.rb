class User < ApplicationRecord
  has_many :shops, dependent: :destroy
  has_one_attached :image
  has_secure_password
  has_secure_token :user_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  validates :password, length: { minimum: 4, maximum: 32 }
end
