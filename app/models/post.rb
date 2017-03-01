class Post < ApplicationRecord
  belongs_to :bar
  has_many :responses
  #belongs_to :user#, through: :bars

  #delegate :post to :user
end

# class Task < ActiveRecord::Base
#   belongs_to :Post
#   delegate :user, :to => :post
# end
