class Clue < ActiveRecord::Base
  belongs_to :city
  has_many :networks, :as => :informable

  validates :city, :presence => true
  validates :description, :presence => true

end
