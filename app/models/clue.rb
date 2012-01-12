class Clue < ActiveRecord::Base
  belongs_to :location

  validates :location, :presence => true
  validates :description, :presence => true

end

