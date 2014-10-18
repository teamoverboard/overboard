class TinyUrlRedirectsController < ApplicationController
  def question
    question = Question.find(params[:id])
    redirect_to question_url(question.id, title: question.title.parameterize)
  end
end
