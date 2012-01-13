class Progress < ActiveRecord::Base
  before_create :set_first_track

  belongs_to :mission
  belongs_to :track

  private

  def set_first_track
    self.track = mission.first_track
  end

end
