class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: "guest")

    if user.admin?
      can :manage, :all
    else user.regular?
      can :manage, Story, user_id: user.id
    end

    can :read, Story

  end
end
