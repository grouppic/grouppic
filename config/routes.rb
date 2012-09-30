Grouppic::Application.routes.draw do
  resources :groups
  resources :topics
  resources :students

  root :to => "pages#index"
  match 'callback' => "pages#callback"
  match 'about' => "pages#about"
  match 'contact' => "pages#contact"

end
