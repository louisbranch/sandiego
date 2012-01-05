class Suspect < ActiveRecord::Base
  before_create :create_mission_suspect
  belongs_to :mission

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
    self.gender = raw_info['gender']
  end

end

