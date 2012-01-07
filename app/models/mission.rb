class Mission < ActiveRecord::Base
  include MissionFormater

  before_create :generate_mission_info
  after_create :create_mission_suspect

  validates :user, :presence => true
  validates :rank, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true

  belongs_to :user
  belongs_to :rank
  has_one :suspect

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

