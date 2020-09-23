class FeedController < ApplicationController

  def index
    @users = FollowRelationship.find_by(follower_id: current_user.id)
    @posts = Post.where(user_id: @users.id)
  end

  def explore
    @users = User.all
  end
end
