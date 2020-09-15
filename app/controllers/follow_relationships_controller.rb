class FollowRelationshipsController < ApplicationController

  def show
  end

  def create
    @follow_relationship = FollowRelationship.new(post_params.merge(follower_id: current_user.id))

    respond_to do |format|
      if @follow_relationship.save
        format.json { render :json  => { status: :created } }
      else
        format.json { render json: @follow_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def follow_relationship_params
      params.require(:follow_relationship).permit(:followee_id)
    end

end
