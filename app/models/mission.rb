class Mission < ActiveRecord::Base
  before_create :calculate_prize
  after_create :create_mission_suspect

  belongs_to :user
  belongs_to :rank
  has_one :suspect

  def self.create_first_missions(num)
    num.times do
      create( :rank => Rank.first )
    end
  end

  private

  def calculate_prize
    self.prize = rank.value + rand(5)
  end

  def create_mission_suspect
    self.create_suspect
  end

end

