class Ability
  include CanCan::Ability

  # Cancan permission settings. Roles are defined in the User model

  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.

  def initialize(user)
    user ||= User.new # if user is not create create a guest user
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "manager"
      can :manage, [Host, User, Offer, ResearchAttempt]
      can :read, :all
    elsif user.role == "supply_employee"
      can :update, [Host, Offer]
      can :create, [ResearchAttempt]
      can :read, :all
    elsif user.role == "researcher"
      can :manage, [Host]
      can :create, [ResearchAttempt]
      can :read, [Site, Offer, ResearchAttempt]
    end
    can [:update, :read], User, :_id => user.id
  end
end
