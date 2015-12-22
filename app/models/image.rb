class Image < ActiveRecord::Base
  validates :title, presence: true
  validates :filepath, presence: true
end
