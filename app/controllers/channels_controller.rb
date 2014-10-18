class ChannelsController < ApplicationController
  def show
    @questions = Channel.where(:name => channel).take.questions
  end

  private

  def channel
    params[:id].downcase
  end
end
