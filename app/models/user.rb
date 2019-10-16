class User < ApplicationRecord
  has_secure_password
  has_many :kifus
  has_many :comments
end
