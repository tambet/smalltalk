module Api
  module V1
    class PostsController < ApplicationController
      respond_to :json

      def index
        respond_with Post.all
      end

      def create
        post = Post.new(post_params)
        post.user = @current_user
        if post.save
          render json: post
        else
          render status: 400, json: post.errors.full_messages
        end
      end

      private
      def post_params
        params.permit(:heading, :body)
      end

    end
  end
end
