class QuestionSearchesController < ApplicationController
  def show
    @results = Question.search(query)
  end

  private

  def query
    params[:query]
  end
end
