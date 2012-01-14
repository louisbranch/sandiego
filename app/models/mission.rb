class Mission < ActiveRecord::Base
  include MissionFormater
  include MissionTracker

  before_create :set_mission_rank
  after_create :create_mission_suspect
  after_create :create_mission_tracks
  after_create :create_mission_info
  after_create :create_mission_progress

  validates :user, :presence => true

  belongs_to :user
  belongs_to :rank
  has_many :tracks, :dependent => :destroy
  has_many :cities, :through => :tracks
  has_one :suspect, :dependent => :destroy
  has_one :progress, :dependent => :destroy

  def first_track
    tracks.where(:level => 0).first
  end

  def first_city
    cities.joins(:tracks).where('tracks.level' => 0).first
  end

  def final_city
    cities.joins(:tracks).where('tracks.final' => true).first
  end

  def current_track
    progress.track
  end

  def current_city
    cities.joins(:tracks).where('tracks.id' => current_track.id).first
  end

  def possible_tracks
    depth = current_track.level
    tracks.where(:level => [depth -1, depth, depth + 1] )
  end

  private

  def create_mission_suspect
    self.create_suspect
  end

  def create_mission_progress
    self.create_progress
  end

  def set_mission_rank
    self.rank = user.rank
  end

end
