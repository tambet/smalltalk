module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate, only: :create
      respond_to :json

      def show
        respond_with @current_user
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render status: 400, json: user.errors.full_messages
        end
      end

      private
      def user_params
        params.permit(:email, :password)
      end

    end
  end
end
