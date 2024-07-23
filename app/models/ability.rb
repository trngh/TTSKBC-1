# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.status != 0
      if user.role_id == 1
        can :manage, :all
      else
        can :read, Event
        can :create, ERegistration
        can :create, EJoin

        can :update, Event do |event|
          event.try(:user) == user
        end

        can [:read, :update], User, id: user.id
      end
    else
      cannot :manage, :all
      cannot :access, :all
      cannot :read, :all
    end
  end
end
