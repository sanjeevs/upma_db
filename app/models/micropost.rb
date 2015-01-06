class Micropost < ActiveRecord::Base
  attr_accessible :content, :tag, :title, :translation, :tweets, :verse
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validates :tweet, length: { maximum: 140 }
  belongs_to :user
  default_scope order: 'microposts.created_at DESC'
end
