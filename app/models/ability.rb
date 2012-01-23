class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can [:read, :create], Mission do |mission|
        mission.try(:user) == user
      end

      can :read, Track do |track|
        track.mission.try(:user) == user
      end

      can :read, Network do |network|
        network.mission.try(:user) == user
      end

      can :create, Message do |message|
        message.mission.try(:user) == user
      end
    end
  end
end
