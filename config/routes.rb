Sandiego::Application.routes.draw do

  resource :canvas, :only => [:show, :new, :create]

  resources :missions, :only => [:index, :show], :path => '/casos' do
    resources :tracks, :only => [:index, :show], :path => '/cidades'
    resources :networks, :only => :show, :path => '/locais'
    resources :traits, :only => :index, :path => '/pistas'
    resources :messages, :only => [:new, :create]
  end

  resources :rules, :only => :index
  resources :ranks, :only => :index
  resource :about, :only => :show, :controller => 'about'

  resources :cities do
    resources :clues
  end

  resources :locations

  root :to => 'canvas#show'

end
