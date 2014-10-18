Rails.application.routes.draw do
	root to: "questions#index"

	post "/votes", to: "votes#upvote", as: "upvote"

	resources :questions
	resources :answers
	resources :votes
end
