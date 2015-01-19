class Micropost < ActiveRecord::Base
  attr_accessible :content, :tags, :title, :translation, :tweet, :verse, 
    :author, :published_at, :urn
  validates :author, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validates :tweet, length: { maximum: 140 }
  default_scope order: 'microposts.created_at DESC'

  before_save :default_values
  validate :urn_format

  def default_values
    self.urn = "verse:0" if self.urn.blank?
  end

  def urn_format
    errors.add(:urn, "invalid format. Expect 'verse:<number>'.Got '#{urn}'") \
      if /verse:\d+/.match(urn).nil?
  end
end
