class FeedController < ApplicationController
  def index
  end

  def explore
    @users = User.all
  end
end
