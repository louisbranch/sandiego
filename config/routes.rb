Sandiego::Application.routes.draw do

  resource :canvas, :only => [:show, :new, :create]
  resources :missions, :only => [:index, :show, :create]

  resources :cities do
    resources :clues
  end

  resources :locations

  root :to => 'canvas#show'

end
