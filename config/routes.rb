Rails.application.routes.draw do
  get 'groups/all', to: 'groups#all'
  
  resources :messages
  resources :groups
  resources :groups do 
    get 'friend/', to: 'groups#friend'
    post 'raffle/', to: 'groups#raffle'
    get 'chat/', to: 'groups#chat'
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
