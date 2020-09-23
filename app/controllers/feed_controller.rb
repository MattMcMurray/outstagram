class FeedController < ApplicationController

  def index
    @users = FollowRelationship.find_by(follower_id: current_user.id)
    @posts = Post.joins(:user).where(posts: {user_id: @users.id})
  end

  def explore
    @users = User.where.not(id: current_user.id)
  end
end
