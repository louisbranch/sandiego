class Rank < ActiveRecord::Base

  validates :name, :presence => true
  validates :track_depth, :presence => true
  validates :track_breadth, :presence => true

  def stars
    stars = '&#9733' * position
    stars.html_safe
  end

end
