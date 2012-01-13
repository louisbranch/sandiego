module MissionTracker

  def generate_mission_tracks
    @cities = City.all.map(&:id)
    create_first_track(city)
    min_level = 1
    max_level = rank.track_depth
    while min_level <= max_level
      create_correct_track(city, min_level)
      rank.track_breadth.times do
        create_wrong_track(city, min_level)
      end
      min_level += 1
    end
  end

  private

  def city
    @cities.slice!(rand(@cities.length - 1))
  end

  def create_first_track(city)
    self.tracks.create({ :city_id => city, :level => 0, :correct => true, :final => false})
  end

  def create_correct_track(city, level)
    if level == rank.track_depth # Last track
      self.tracks.create({ :city_id => city, :level => level, :correct => true, :final => true})
    else
      self.tracks.create({ :city_id => city, :level => level, :correct => true, :final => false})
    end
  end

  def create_wrong_track(city, level)
    self.tracks.create({ :city_id => city, :level => level, :correct => false, :final => false})
  end

end
