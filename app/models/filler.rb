class Filler < ActiveRecord::Base

  has_many :networks, :as => :informable

  scope :correct_ones, :conditions => { :correct => true }
  scope :wrong_ones, :conditions => { :correct => false }

end
