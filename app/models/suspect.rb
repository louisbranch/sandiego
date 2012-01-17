class Suspect < ActiveRecord::Base
  before_save :create_mission_suspect
  after_create :create_suspect_traits

  belongs_to :mission
  has_many :traits, :dependent => :destroy

  serialize :raw_info

  def user
    mission.user
  end

  def photo_url
    if mission.finished?
      "https://graph.facebook.com/#{facebook_id}/picture?type=large"
    else
      'suspect.gif'
    end
  end

  def alias
    if mission.finished?
      name
    else
      'Desconhecido'
    end
  end

  private

  def create_mission_suspect
    self.raw_info = user.valid_random_friend
    parse_raw_info
  end

  def parse_raw_info
    self.facebook_id = raw_info['id']
    self.name = raw_info['name']
    self.gender = raw_info['gender']
  end

  def create_suspect_traits
    traits.new.gender
    traits.new.birthday
    traits.new.hometown
    traits.new.current_city
    traits.new.education
    traits.new.work
    traits.new.language
    traits.new.relationship_status
  end

end
