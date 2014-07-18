module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate

      def create
        user = User.first #.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          render json: user
        else
          render status: 401, json: 'Unauthorized'
        end
      end

      def destroy
        session[:user_id] = nil
        render status: 200, json: 'OK'
      end

    end
  end
end
