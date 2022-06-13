Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'meetings#new'
  
  devise_for :users, :controllers => {
  :registrations => "users/registrations" 
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :meetings do
  collection do
    get 'search'
  end
end
  resources :users
  resources :feedbacks
end
