Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#home'

  get "questions/home" => "questions#home"
  post "bookmarks/:question_id/create" => "bookmarks#create"
  post "bookmarks/:question_id/destroy" => "bookmarks#destroy"

  resources :profiles, only: [:show, :new, :create, :edit, :update]

  resources :beauty_events, only: [:show, :new, :create, :edit, :update, :destroy]

  resources :papas, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :papa_events, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :questions do
    resources :comments, only: [:create, :destroy]
    resources :bookmarks, only: [:index, :create, :destroy]
  end
end
