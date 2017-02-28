class Post < ApplicationRecord
  belongs_to :bar
  has_many :responses
end
