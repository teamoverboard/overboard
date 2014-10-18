class QuestionsController < ApplicationController
  before_action :authenticate_user!, :only => [ :new, :create ]
  autocomplete :channel, :name

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
    	redirect_to tiny_question_path(@question)
    else
    	render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private

  def question_params
  	params.require(:question).permit(:title, :description).merge(:user_id => current_user.id, :channel_id => channel.id)
  end

  def channel
    Channel.find_or_create(channel_name)
  end

  def channel_name
    params.require(:question).permit(:channel)['channel']
  end
end
