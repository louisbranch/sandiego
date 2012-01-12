class Track < ActiveRecord::Base
  belongs_to :mission
  belongs_to :location
end
