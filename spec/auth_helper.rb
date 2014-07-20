module AuthHelper
  def authWithUser(user)
    session[:user_id] = user.id
  end

  def basic_auth(user)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic
      .encode_credentials(user.email, user.password)
  end
end
