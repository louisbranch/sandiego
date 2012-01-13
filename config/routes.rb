Sandiego::Application.routes.draw do

  resource :canvas, :only => [:show, :new, :create]
  resources :missions, :only => [:index, :show, :create] do
    member do
      get 'map'
      put 'progress'
    end
  end

  resources :cities do
    resources :clues
  end

  resources :locations

  root :to => 'canvas#show'

end
