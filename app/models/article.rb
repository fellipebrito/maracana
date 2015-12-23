class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  has_many :comments, as: :commentable
end
