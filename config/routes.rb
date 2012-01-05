Sandiego::Application.routes.draw do
  resource :canvas, :only => [:show, :new, :create]

  root :to => 'canvas#show'

end

