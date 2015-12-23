class Image < ActiveRecord::Base
  validates :title, presence: true
  validates :filepath, presence: true

  has_many :comments, as: :commentable
end
