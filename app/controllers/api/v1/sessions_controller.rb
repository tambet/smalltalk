module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate
      BasicAuth = ActionController::HttpAuthentication::Basic

      def create
        unless BasicAuth::has_basic_credentials?(request)
          render_unauthorized && return
        end

        username, pass = BasicAuth::user_name_and_password(request)
        user = User.authenticate(username, pass)

        if user
          session[:user_id] = user.id
          render json: user
        else
          render_unauthorized
        end
      end

      def destroy
        reset_session
        render status: 200, json: 'OK'
      end

    end
  end
end
