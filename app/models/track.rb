class Track < ActiveRecord::Base
  belongs_to :mission
  belongs_to :city
  has_one :progress
  has_many :networks

end
