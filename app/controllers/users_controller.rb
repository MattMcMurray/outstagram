class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_id(params[:id])
    @posts = Post.where(user_id: @user.id)
    @follow_relationship_exists = FollowRelationship.where(follower_id: current_user.id, followee_id: @user.id, active: true).exists?
  end

  def follow

    @follow = FollowRelationship.new(follower_id: current_user.id,
                                                  followee_id: params[:followee], active: true)

    @follow.save
    # TODO: check for errors
    redirect_to :controller => 'users', :action => 'show', :id => params[:followee]
  end

  def unfollow

    @follow = FollowRelationship.where(follower_id: current_user.id, followee_id: params[:followee]).update(active: false)
    # TODO: check for errors
    redirect_to :controller => 'users', :action => 'show', :id => params[:followee]
  end

end
