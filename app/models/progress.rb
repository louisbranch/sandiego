class Progress < ActiveRecord::Base
  before_create :set_first_track
  before_create :set_hours

  belongs_to :mission
  belongs_to :track
  belongs_to :network

  validates :mission, :presence => true

  def city_travel(track)
    self.track = track
    hours = 10
    reduce_time(hours)
  end

  def location_travel(network)
    self.network = network
    hours = 3
    reduce_time(hours)
  end

  def elapsed?
    remaining_hours <= 0
  end

  private

  def set_first_track
    self.track = mission.first_track
  end

  def set_hours
    self.remaining_hours = mission.hours
  end

  def reduce_time(hours)
    self.remaining_hours -= hours
    self.save
    if elapsed?
      mission.finish
      raise OverTime
    end
  end

  class OverTime < StandardError
  end

end
