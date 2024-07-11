# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # người dùng chưa đăng nhập

    if user.status != 0
      if user.role_id == 1
        can :manage, :all
        can :access, :'home/manager'
      else
        can :read, Event
        can :create, Event
        cannot :access, :'home/manager'
        # cannot :access, :'e_registrations'

        can :update, Event do |event|
          event.try(:user) == user
        end
        can :destroy, Event do |event|
          event.try(:user) == user
        end

        can [:read, :update], User, id: user.id

        can :create, EJoin

        # can :read, ERegistrations
        can :create, ERegistration
      end
    else
      cannot :manage, :all
      cannot :access, :all
      cannot :read, :all
    end
  end
end
