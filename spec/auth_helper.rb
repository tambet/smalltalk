module AuthHelper
  def authWithUser(user)
    session[:user_id] = user.id
  end
end
