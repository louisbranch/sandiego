class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission

  def share(mission)
    self.mission = mission
    self.user = mission.user
    self.description = "Capturei #{mission.suspect.name} no Caso: #{mission.headline.name} no jogo Project Sandiego"
    self.save
    wall_post
    user.increase_xp(50)
  end

  def wall_post
    graph = Koala::Facebook::API.new(user.oauth_token)
    graph.put_wall_post(description,{},mission.suspect.facebook_id)
    graph.put_wall_post(description)
  end

end
