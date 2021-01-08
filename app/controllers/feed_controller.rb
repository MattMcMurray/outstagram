class FeedController < ApplicationController

  def index
    @users = FollowRelationship.find_by(follower_id: current_user.id, active: true)

    if @users != nil
      @posts = Post.joins(:user)
                .where(posts: {user_id: @users.followee_id})
                .or(Post.joins(:user).where(posts: {user_id: current_user.id}))
                .order(created_at: :desc)
    else
      @posts = Post.where(posts: {user_id: current_user.id})
    end
  end

  def explore
    @users = User.where.not(id: current_user.id)
    # TODO: select posts not created by logged in user
    @posts = Post.limit(25).order("RANDOM()")
  end
end
