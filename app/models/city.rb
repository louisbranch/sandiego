class City < ActiveRecord::Base
  has_many :tracks
  has_many :missions, :through => :tracks

end
