class Location < ActiveRecord::Base
  has_many :clues

  validates :city, :presence => :true
  validates :country, :presence => :true

end

