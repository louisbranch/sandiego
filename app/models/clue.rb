class Clue < ActiveRecord::Base
  belongs_to :city

  validates :city, :presence => true
  validates :description, :presence => true

end
