class FeedController < ApplicationController

  def index
    @users = FollowRelationship.find_by(follower_id: current_user.id)
    if @users != nil
      @posts = Post.joins(:user)
                .where(posts: {user_id: @users.followee_id})
                .or(Post.joins(:user).where(posts: {user_id: current_user.id}))
    else
      @posts = []
    end
  end

  def explore
    @users = User.where.not(id: current_user.id)
  end
end
