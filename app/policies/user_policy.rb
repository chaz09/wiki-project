class UserPolicy < ApplicationPolicy

def set_user
  if params[:id] = "sign_out"
    sign_out current_user
    return
  end
end
