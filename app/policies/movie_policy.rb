class MoviePolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, movie)
    @user = user
    @post = movie
  end

  def new?
    user.is_admin?
  end

  def update?
    user.is_admin?
  end

  def update?
    user.is_admin?
  end

end
