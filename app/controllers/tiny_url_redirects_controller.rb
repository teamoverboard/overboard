class TinyUrlRedirectsController < ApplicationController
  def question
    question = Question.find(id)
    redirect_to question_url(question.id, title: question.title.parameterize)
  end

  def channel
    channel = Channel.find_by_name(id)
    redirect_to channel_url(channel.name.parameterize)
  end

  private

  def id
    params[:id]
  end
end
