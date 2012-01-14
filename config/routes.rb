Sandiego::Application.routes.draw do

  resource :canvas, :only => [:show, :new, :create]

  resources :missions, :only => [:index, :show, :create] do
    resources :tracks, :only => [:index, :show], :path => '/cities'
    resources :networks, :only => [:index, :show], :path => '/locations'
    resources :traits, :only => :index
  end

  resources :cities do
    resources :clues
  end

  resources :locations

  root :to => 'canvas#show'

end
