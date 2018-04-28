class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, :all
    else
      can :read, :home
      can [:new, :read], Certification
      can [:new, :read], Education
      can [:new, :read], Occupation
      can [:new, :read], Post, confidential: false
      can [:new, :read], Project
      can [:new, :read], Tag
    end
  end
end
