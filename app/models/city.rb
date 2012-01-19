class City < ActiveRecord::Base
  has_many :clues
  has_many :tracks
  has_many :missions, :through => :tracks

  default_scope :order => 'name ASC'

  def full_name
    "#{name} / #{country}"
  end

end
