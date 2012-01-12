module MissionTracker

  def generate_mission_tracks
    @locations = Location.all.map(&:id)
    min_level = 1
    max_level = rank.track_depth
    while min_level <= max_level
      create_correct_track(location, min_level)
      rank.track_breadth.times do
        create_wrong_track(location, min_level)
      end
      min_level += 1
    end
  end

  private

  def location
    @locations.slice!(rand(@locations.length - 1))
  end

  def create_correct_track(location, level)
    case level
      when 1 # First track
        self.tracks.create({ :location_id => location, :level => level, :correct => true, :initial => true, :final => false})
      when rank.track_depth # Last track
        self.tracks.create({ :location_id => location, :level => level, :correct => true, :initial => false, :final => true})
      else
        self.tracks.create({ :location_id => location, :level => level, :correct => true, :initial => false, :final => false})
    end
  end

  def create_wrong_track(location, level)
    self.tracks.create({ :location_id => location, :level => level, :correct => false, :initial => false, :final => false})
  end

end
