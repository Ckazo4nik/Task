class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    @user = user

    if user
      user.admin? ? admin_abilities : user_abilities
    else
      guest_abilities
    end

  end

  def guest_abilities
    can :read, :all
  end
  def admin_abilities
    can :manage, :all
  end
  def user_abilities
    guest_abilities
    can :create, [Advert, Comment]
    can :update, [Advert],  user: user
    can :destroy, [Advert], user: user

  end
end
