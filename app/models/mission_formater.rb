module MissionFormater
  MISSIONS = YAML::load(File.read(Rails.root.join('config/infos/missions.yml')))

  def create_mission_info
    mission_info = MISSIONS.sample
    self.name = mission_info['name']
    self.description = mission_info['description']
  end

end
