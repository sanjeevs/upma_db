class Verse < ActiveRecord::Base
  attr_accessible :content, :english, :position, :upanishad_id, :category
  attr_accessor :chapter_num, :section_num, :verse_num
  belongs_to :upanishad

  validates :upanishad_id, presence: true
  validates :content, presence: true
  validates :category, presence: true

  default_scope order: 'verses.position ASC'
end
