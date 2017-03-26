class Ability
  include CanCan::Ability

  def initialize(user)
    user = User.current
    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    else
      can :read, Post
      can :read, Event
      can :read, Vacancy
      can :create, Contact
      cannot :access, :rails_admin
      cannot :dashboard
    end
  end
end
