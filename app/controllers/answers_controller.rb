class AnswersController < ApplicationController
	def create
		@answer = Answer.new(answer_params)

		if @answer.save
			redirect_to(:back)
		else
			render :new
		end
	end

	private

	def answer_params
    params.require(:answer).permit(:content, :question_id).merge(:user_id => current_user.id)
	end

end
