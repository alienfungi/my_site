class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, :all
    else
      can :new, [Certification, Education, Occupation, Post, Project, Tag]
      can :read, [Certification, Education, Occupation, Post, Project, Tag]
    end
  end
end
