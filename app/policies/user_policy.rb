class UserPolicy < ApplicationPolicy
  def collaborator?(wiki, user)
      if Relationship.exists?(:wiki_id =>wiki.id, :user_id => user.id)
          true
      else
          false
      end
  end
