class Bar < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :posts, dependent: :destroy
end
