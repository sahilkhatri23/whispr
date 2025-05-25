Rails.application.routes.draw do
  root "confessions#index"

  resources :confessions, only: [:index, :new, :create] do
    resources :reactions, only: [:create]
  end
end
