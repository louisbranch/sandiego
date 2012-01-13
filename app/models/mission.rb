class Mission < ActiveRecord::Base
  include MissionFormater
  include MissionTracker

  before_create :set_mission_rank
  after_create :generate_mission_tracks
  after_create :generate_mission_info

  #validates :user, :presence => true

  belongs_to :user
  belongs_to :rank
  has_many :tracks, :dependent => :destroy
  has_many :cities, :through => :tracks
  has_one :suspect, :dependent => :destroy

  def first_city
    tracks.where(:level => 0).first.city
  end

  def final_city
    tracks.where(:final => true).first.city
  end

  private

  def create_mission_suspect
    self.create_suspect
  end

  def set_mission_rank
    self.rank = user.rank
  end

end
