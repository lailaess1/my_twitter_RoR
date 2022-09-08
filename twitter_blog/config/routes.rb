Rails.application.routes.draw do
  root "main#index"

  get "about-us", to: "abouts#index", as: :about

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  
  delete "logout", to: "sessions#destroy"

  
  resources :users do
    resources :articles
  end

  resources :users do
    resources :messages
  end

  resources :users do
    resources :articles do 
      resources :comments
    end
  end


  resources :articles do 
    resources :comments
  end

  resources :articles do 
    resources :likes
  end

  resources :articles do 
    resources :retweets
  end

  resources :articles
  resources :comments
  resources :listemessages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
