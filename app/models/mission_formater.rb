module MissionFormater
  MISSIONS = YAML::load(File.read(Rails.root.join('config/infos/missions.yml')))
  NAMES = YAML::load(File.read(Rails.root.join('config/infos/names.yml')))
  LOCATIONS = YAML::load(File.read(Rails.root.join('config/infos/locations.yml')))

  def generate_mission_info
    mission_info = MISSIONS.sample
    self.name = mission_info['name']
    self.description = mission_info['description']
    replace_mission_description
  end

  private

  def replace_mission_description
    replace_names
    replace_dates
    replace_locations
  end

  def replace_names
    male_regex = /%%male_name%%/
    female_regex = /%%female_name%%/
    if description.match(male_regex)
      name = NAMES['male'].sample
      new_description = description.gsub(male_regex, name)
      self.description = new_description
    elsif description.match(female_regex)
      name = NAMES['female'].sample
      new_description = description.gsub(female_regex, name)
      self.description = new_description
    end
  end

  def replace_dates
    regex = /%%yesterday%%/
    if description.match(regex)
      weekday = I18n.localize(Time.now.yesterday, :format => '%A')
      new_description = description.gsub(regex, weekday)
      self.description = new_description
    end
  end

  def replace_locations
    location = LOCATIONS.sample
    city_regex = /%%city%%/
    country_regex = /%%country%%/
    if name.match(city_regex)
      new_name = name.gsub(city_regex, location['city'])
      self.name = new_name
    end
    if name.match(country_regex)
      new_name = name.gsub(country_regex, location['country'])
      self.name = new_name
    end
    if description.match(city_regex)
      new_description = description.gsub(city_regex, location['city'])
      self.description = new_description
    end
    if description.match(country_regex)
      new_description = description.gsub(country_regex, location['country'])
      self.description = new_description
    end
  end

end

