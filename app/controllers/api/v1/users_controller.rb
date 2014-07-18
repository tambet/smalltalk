module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def show
        respond_with User.first
      end

      def create
        user = User.new(user_params)
        if user.save
          respond_with user
        else
          render status: 401, json: {}
        end
      end

    end
  end
end
