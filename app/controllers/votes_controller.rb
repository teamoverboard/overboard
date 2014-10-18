class VotesController < ApplicationController

  def upvote
    @vote = Vote.new(voteable_id:   params[:voteable_id], 
    	               voteable_type: params[:voteable_type],
    	               user_id:       params[:user_id])

    redirect_to(:back) if @vote.save
  end
end