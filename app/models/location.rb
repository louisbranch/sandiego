class Location < ActiveRecord::Base
  has_many :clues, :dependent => :destroy
  has_many :tracks, :dependent => :destroy

  validates :city, :presence => :true
  validates :country, :presence => :true

end
