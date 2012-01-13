class Location < ActiveRecord::Base

  validates :name, :presence => :true
  validates :witness, :presence => :true

end
