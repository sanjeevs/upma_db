class Verse < ActiveRecord::Base
  attr_accessible :content, :english, :index, :upanishad_id
  belongs_to :upanishad

  validates :upanishad_id, presence: true
end
