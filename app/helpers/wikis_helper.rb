module WikisHelper
  def user_is_authorized_for_wikis?(wiki)
      current_user.admin? || current_user.premium?
  end
end
