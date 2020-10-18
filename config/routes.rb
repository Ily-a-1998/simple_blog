Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  resources :posts  do # отслеживаниее url адресов постов # do - привязка коментариев к постам post_id/comments
  	resources :comments # отслеживает url адресов коментариев
  end	
end
