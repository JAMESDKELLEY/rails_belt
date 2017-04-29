Rails.application.routes.draw do
	root 'users#new'
	
	resources :users
	resources :ideas

	post 'register' => 'users#create'
	post 'sessions' => 'sessions#create'
	post 'like/:id' => 'ideas#like'
	get 'likes/:id' => 'ideas#likes'
	get 'logout' => 'sessions#destroy'
	delete 'idea/:id' => 'ideas#destroy'

end
