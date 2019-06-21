class User < ApplicationRecord
  has_secure_password
  has_secure_token :user_token
end