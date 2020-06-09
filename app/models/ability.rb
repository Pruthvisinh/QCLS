# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.super_admin?
      super_admin_permissions(user)
    elsif user.admin?
      admin_permissions(user)
    elsif user.staff?
      staff_permissions(user)
    elsif user.individual?
      individual_permissions(user)
    else
      can :read, :all
    end
  end

  private ##

  def super_admin_permissions(user)
    can :manage, User
    can :manage, :admin
    can :manage, :staff
    can :manage, :individual

    can :manage, Doc
  end

  def admin_permissions(user)
    can :manage, :staff
    can :manage, :individual
    can :manage, User do |user|
      %w(staff individual).include?(user.role)
    end

    can :manage, Doc
  end

  def staff_permissions(user)
    can :read, :individual
    can :read, User do |user|
      user.individual?
    end
  end

  def individual_permissions(user)
  end
end
