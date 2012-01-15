class Network < ActiveRecord::Base
  belongs_to :track
  belongs_to :location
  belongs_to :informable, :polymorphic => true

  validates :track, :presence => true
  validates :location, :presence => true
  validates :informable, :presence => true

  def trait?
    informable_type == 'Trait'
  end

end
