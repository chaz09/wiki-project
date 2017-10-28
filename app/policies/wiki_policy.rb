class WikiPolicy < ApplicationPolicy

  def index
  @wikis = Wiki.all
  end

  def show?

    if @record.private?
      user.id == record.user_id or user.admin? or record.users.include?(user)
    else
      true
    end
  end

  def create?
    check_logged_in
    user.present?
  end

  def new?
    check_logged_in
    user.present?
  end

  def update?
    check_logged_in
    user.id == record.user_id or user.admin? or record.users.include?(user)
  end

  def edit?
    check_logged_in
    user.id == record.user_id or user.admin? or record.users.include?(user)
  end

  def destroy?
    check_logged_in
    user.id == record.user_id or user.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       wikis = []
       if user.role == 'admin'
         wikis = scope.all
       elsif user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wikis || wiki.owner == user || wiki.collaborators.include?(user)
             wikis << wiki
           end
         end
       else
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wikis || wiki.collaborators.include?(user)
             wikis << wiki
           end
         end
       end
       wikis
     end
   end
end
