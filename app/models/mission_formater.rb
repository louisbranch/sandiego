module MissionFormater
  MISSIONS = YAML::load(File.read(Rails.root.join('config/infos/missions.yml')))

  def create_mission_info
    mission_info = MISSIONS.sample
    self.name = mission_info['name']
    self.description = mission_info['description']
    replace_mission_description
    self.save
  end

  private

  def replace_mission_description
    replace_dates
    replace_city
    replace_country
  end

  def replace_dates
    regex = /%%yesterday%%/
    if description.match(regex)
      weekday = I18n.localize(Time.now.yesterday, :format => '%A')
      new_description = description.gsub(regex, weekday)
      self.description = new_description
    end
  end

  def replace_city
    regex = /%%city%%/
    if description.match(regex)
      city = first_city.name
      new_description = description.gsub(regex, city)
      self.description = new_description
    end
  end

  def replace_country
    regex = /%%country%%/
    if description.match(regex)
      country = first_city.country
      new_description = description.gsub(regex, country)
      self.description = new_description
    end
  end

end
