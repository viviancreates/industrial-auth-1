class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.present?  
  end

  def update?
    user == comment.author
  end

  def destroy?
    user == comment.author || user.admin?
  end

  def show?
    true
  end
end
