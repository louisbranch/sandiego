module MissionFormater
  MISSIONS = YAML::load(File.read(Rails.root.join('config/infos/missions.yml')))

  def generate_mission_info
    mission_info = MISSIONS.sample
    self.name = mission_info['name']
    self.description = mission_info['description']
    replace_mission_description
  end

  private

  def replace_mission_description
    replace_dates
  end

  def replace_dates
    regex = /%%yesterday%%/
    if description.match(regex)
      weekday = I18n.localize(Time.now.yesterday, :format => '%A')
      new_description = description.gsub(regex, weekday)
      self.description = new_description
    end
  end

end
