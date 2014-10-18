class VotesController < ApplicationController

  def upvote
    @vote = Vote.new(voteable_id:   params[:voteable_id], 
    	               voteable_type: params[:voteable_type])
    
    redirect_to root_path if @vote.save
  end

end