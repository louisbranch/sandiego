#encoding: UTF-8
class Mission < ActiveRecord::Base
  include MissionFormater
  include MissionTracker

  before_create :set_mission_rank
  before_create :set_mission_hours
  before_create :create_mission_info
  after_create :create_mission_suspect
  after_create :create_mission_tracks
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

  def finish
    self.finished = true
    if suspect.traits.found.count >= rank.track_depth
      self.won = true
    else
      self.won = false
    end
    self.save
    collapse
  end

  def overtime
    self.finished = true
    self.won = false
    self.save
    collapse
  end

  def status
    case
      when finished? && won?
        'Caso concluído: suspeito preso'
      when finished? && !won?
        'Caso perdido: suspeito escapou'
      when new_mission?
        'Caso não iniciado'
      else
        'Caso em andamento'
    end
  end

  def new_mission?
    if !finished? && hours == progress.remaining_hours
      true
    else
      false
    end
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

  def set_mission_hours
    self.hours = 72
  end

  def collapse
    tracks.destroy_all
  end

end
