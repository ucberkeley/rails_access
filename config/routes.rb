Access::Engine.routes.draw do
  resources :permissions

  resources :assignments

  resources :operations

  resources :roles

end
