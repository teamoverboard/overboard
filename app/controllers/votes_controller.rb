class VotesController < ApplicationController
  def upvote
    @vote = Vote.create(vote_params)
    redirect_to(:back)
  end

  private

  def vote_params
    {
      voteable_id: params[:voteable_id],
      voteable_type: params[:voteable_type],
    }.merge(:user_id => current_user.id)
  end
end
