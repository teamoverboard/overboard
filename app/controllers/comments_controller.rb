class CommentsController < ApplicationController
  def create
    commentable.comments.create(comment_params)
    redirect_to(:back)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end

  def commentable
    if answer_id.present?
      Answer.find(answer_id)
    elsif question_id.present?
      Question.find(question_id)
    else
      raise "No such commentable!!"
    end
  end

  def answer_id
    params[:answer_id]
  end

  def question_id
    params[:question_id]
  end
end
