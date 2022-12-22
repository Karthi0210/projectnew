Rails.application.routes.draw do
 root "pages#home"
 get 'pages/home', to: 'pages#home'
# get '/books' , to: 'books#index'
 #get 'books/new' , to: 'books#new' , as: 'new_book'
 #get '/books/:id' , to: 'books#show' , as:'book'
 #post 'books', to: 'recipes#create'


 resources :books



end
