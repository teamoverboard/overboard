Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:sessions]

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :users do
    resource :guest, :only => [ :create ]
  end

	root to: "questions#index"

	post "/votes", to: "votes#upvote", as: "upvote"

	resources :questions
	resources :answers
	resources :votes
end
