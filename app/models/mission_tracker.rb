module MissionTracker

  def create_mission_tracks
    @cities = City.all.map(&:id)
    @locations = Location.all.map(&:id)
    @traits = suspect.traits.map(&:id)
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

  def location
    @locations.slice!(rand(@locations.length - 1))
  end

  def trait
    @traits.slice!(rand(@traits.length - 1))
  end

  def create_first_track(city)
    track = self.tracks.create(:city_id => city, :level => 0, :correct => true, :final => false)
    create_network_information(track, city)
  end

  def create_correct_track(city, level)
    if level == rank.track_depth # Last track
      self.tracks.create(:city_id => city, :level => level, :correct => true, :final => true)
      #create final information
    else
      track = self.tracks.create(:city_id => city, :level => level, :correct => true, :final => false)
      create_network_information(track, city)
    end
  end

  def create_wrong_track(city, level)
    self.tracks.create(:city_id => city, :level => level, :correct => false, :final => false)
  end

  def create_network_information(track, city)
    create_suspect_information(track)
    clues = Clue.where(:city_id => city)
    2.times do
      clue = clues.slice!(rand(clues.length - 1))
      create_city_information(track, clue)
    end
  end

  def create_suspect_information(track)
    track.networks.create(:location_id => location, :informable_id => trait, :informable_type => 'Trait')
  end

  def create_city_information(track, clue)
    track.networks.create(:location_id => location, :informable_id => clue, :informable_type => 'Clue')
  end

end
