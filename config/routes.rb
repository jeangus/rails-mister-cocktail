Rails.application.routes.draw do
  resources :doses, only: [:destroy]
  resources :cocktails do
    resources :doses, only: [:new, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
