class Rank < ActiveRecord::Base

  validates :name, :presence => true
  validates :track_depth, :presence => true
  validates :track_breadth, :presence => true

end
