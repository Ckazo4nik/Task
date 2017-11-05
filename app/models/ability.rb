class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    @user = user

    if user
      if user.admin?
        admin_abilities
      elsif user.moderator?
         user_abilities
      else
        user_abilities
      end
    else
      guest_abilities
    end

  end

  def moderator_abilities
    can :create, :all
    can :destroy, :all
    can :update, :all
  end

  def guest_abilities
    can :read, :all
  end
  def admin_abilities
    can :manage, :all
  end
  def user_abilities
    if user.moderator?
      moderator_abilities
    end
    guest_abilities
    can :create, [Advert, Comment]
    can :update, [Advert],  user: user
  end
end
