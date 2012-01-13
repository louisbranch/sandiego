class Mission < ActiveRecord::Base
  include MissionFormater
  include MissionTracker

  before_create :set_mission_rank
  after_create :generate_mission_tracks
  after_create :generate_mission_info
  after_create :create_mission_progress
  #after_create :create_mission_suspect

  #validates :user, :presence => true

  belongs_to :user
  belongs_to :rank
  has_many :tracks, :dependent => :destroy
  has_many :cities, :through => :tracks
  has_one :suspect, :dependent => :destroy
  has_one :mission_progress, :dependent => :destroy

  def first_track
    tracks.where(:level => 0).first
  end

  def first_city
    cities.joins(:tracks).where('tracks.level' => 0).first
  end

  def final_city
    cities.joins(:tracks).where('tracks.final' => true).first
  end

  def current_city
    cities.joins(:tracks).where('tracks.id' => mission_progress.track_id).first
  end

  def possible_tracks
    depth = mission_progress.track.level
    tracks.where(:level => [depth -1, depth, depth + 1] )
  end

  private

  def create_mission_suspect
    self.create_suspect
  end

  def create_progress
    self.create_mission_progress
  end

  def set_mission_rank
    self.rank = user.rank
  end

end
