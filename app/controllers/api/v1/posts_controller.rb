module Api
  module V1
    class PostsController < ApplicationController
      respond_to :json

      def index
        respond_with Post.order(created_at: :desc)
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

      def destroy
        post = Post.where("id = ? AND (? OR user_id = ?)",
          params[:id], @current_user.admin, @current_user.id).first
        if post && post.destroy
          render status: 200, json: 'OK'
        else
          render status: 403, json: 'Forbidden'
        end
      end

      private
      def post_params
        params.permit(:heading, :body)
      end

    end
  end
end
