Sandiego::Application.routes.draw do

  resource :canvas, :only => [:show, :new, :create]

  resources :missions, :only => [:index, :show], :path => '/casos' do
    resources :tracks, :only => [:index, :show], :path => '/cidades'
    resources :networks, :only => [:index, :show], :path => '/locais'
    resources :traits, :only => :index, :path => '/pistas'
  end

  resources :cities do
    resources :clues
  end

  resources :locations

  root :to => 'canvas#show'

end
