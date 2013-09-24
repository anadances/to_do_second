ToDo::Application.routes.draw do
  resources :tasks, :except => [:show, :index]
  resources :lists

  root :to => 'lists#index'
end
