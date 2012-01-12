class Mission < ActiveRecord::Base
  include MissionFormater
  include MissionTracker

  before_create :generate_mission_info
  after_create :generate_mission_tracks
  after_create :create_mission_suspect

  belongs_to :user
  belongs_to :rank
  has_many :tracks, :dependent => :destroy
  has_many :locations, :through => :tracks
  has_one :suspect, :dependent => :destroy

  def self.create_first_missions(num)
    num.times do
      create( :rank => Rank.first )
    end
  end

  private

  def create_mission_suspect
    self.create_suspect
  end

end
