Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}, skip: [:sessions]

  devise_scope :user do
    get :sign_out, to: 'devise/sessions#destroy', as: 'destroy_user_session'
  end

  namespace :users do
    resource :guest, only: [:create]
  end

	post 'votes', to: 'votes#upvote', as: 'upvote'

  get 'search' => 'question_searches#show'
	get 'questions/:id/:title', to: 'questions#show', as: 'question'
  get 'q/:id', to: 'tiny_url_redirects#question', as: 'tiny_question'
  get 'c/:id', to: 'tiny_url_redirects#channel', as: 'tiny_channel'
  get 'users/:id/:name', to: 'users#show', as: 'user'

  resources :questions do
    get :autocomplete_channel_name, :on => :collection
  end

	resources :answers
  resources :channels
  resources :users

  root to: 'questions#index'
end
