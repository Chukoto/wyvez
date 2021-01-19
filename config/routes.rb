Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'questions#home'

  get "questions/home" => "questions#home"
  post "bookmarks/:question_id/create" => "bookmarks#create"
  post "bookmarks/:question_id/destroy" => "bookmarks#destroy"
  
  resources :profiles, except: [:index, :destroy]

  resources :beauty_events, except: [:index]

  resources :papas, except: [:index] do
    resources :papa_events, except: [:index]
  end

  resources :questions do
    resources :comments, only: [:create, :destroy]
    resources :bookmarks, only: [:index, :create, :destroy]
  end
end
