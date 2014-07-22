class Upanishad < ActiveRecord::Base
  attr_accessible :name  
  validates :name, presence: true
  has_many :verses
  default_scope order: 'name ASC'
end
