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
      can :manage, [Customer]
      can :read, :all
    elsif user.role == "employee"
#      can :update, [Bla]
#      can :create, [Blubb]
      can :read, :all
    end
    can [:update, :read], User, :_id => user.id
  end
end
