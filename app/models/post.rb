class Post < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  validates :body, presence: true
  validates :title, presence: true
end