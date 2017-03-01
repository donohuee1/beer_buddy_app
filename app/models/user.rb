class User < ApplicationRecord
  has_many :bars
  has_many :responses
  has_many :posts, through: :bars
  has_secure_password
  # Verify that an email exists and that it does not already exist in the db
  validates :email, presence: true, uniqueness: true
end
