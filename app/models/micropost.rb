class Micropost < ActiveRecord::Base
  attr_accessible :content, :tags, :title, :translation, :tweet, :verse, 
    :author, :published_at
  validates :author, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validates :tweet, length: { maximum: 140 }
  default_scope order: 'microposts.created_at DESC'
end
