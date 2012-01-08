Sandiego::Application.routes.draw do

  resource :canvas, :only => [:show, :new, :create]
  resources :missions, :only => [:index, :show]

  resources :locations do
    resources :clues
  end

  root :to => 'canvas#show'

end

