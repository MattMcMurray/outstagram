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
  end

  def follow

    @follow = FollowRelationship.new(follower_id: current_user.id,
                                                  followee_id: params[:followee], active: true)

    @follow.save
    redirect_to :controller => 'users', :action => 'show', :id => params[:followee]
  end

end
