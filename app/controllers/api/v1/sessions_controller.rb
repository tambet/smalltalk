module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate
    end
  end
end
