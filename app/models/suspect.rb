class Suspect < ActiveRecord::Base
  before_save :create_mission_suspect
  after_create :create_suspect_clues

  belongs_to :mission
  has_many :clues

  validates :mission, :presence => true
  validates :facebook_id, :presence => true
  validates :name, :presence => true

  serialize :raw_info

  def user
    mission.user
  end

  def photo_url
    "https://graph.facebook.com/#{facebook_id}/picture?type=normal"
  end

  private

  def create_mission_suspect
    self.raw_info = user.random_friend
    parse_raw_info
  end

  def parse_raw_info
    self.facebook_id = raw_info['id']
    self.name = raw_info['name']
  end

  def create_suspect_clues
    clues.new.gender
    clues.new.birthday
    clues.new.hometown
    clues.new.current_city
    clues.new.education
    clues.new.work
  end

end

