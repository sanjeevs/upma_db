class Verse < ActiveRecord::Base
  attr_accessible :content, :english, :position, :upanishad_id
  belongs_to :upanishad

  validates :upanishad_id, presence: true

  default_scope order: 'verses.position ASC'
end
