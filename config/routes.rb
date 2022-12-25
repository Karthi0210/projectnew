Rails.application.routes.draw do
 root "pages#home"
 get 'pages/home', to: 'pages#home'
# get '/books' , to: 'books#index'
 #get 'books/new' , to: 'books#new' , as: 'new_book'
 #get '/books/:id' , to: 'books#show' , as:'book'
 #post 'books', to: 'recipes#create'


 resources :books

 get '/signup', to: 'authors#new'
 resources :authors , except: [:new]

 get '/login', to: 'sessions#new'
 post '/login', to: "sessions#create"
 delete '/logout', to: "sessions#destroy"


end
