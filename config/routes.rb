Sandiego::Application.routes.draw do

  resource :canvas, :only => [:show, :new, :create]
  resources :missions, :only => [:index, :show]

  root :to => 'canvas#show'

end

