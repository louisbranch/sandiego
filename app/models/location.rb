class Location < ActiveRecord::Base
  has_many :clues

  validates :cty, :presence => :true
  validates :country, :presence => :true

end

