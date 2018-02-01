Rails.application.routes.draw do
  resources :cour do
  	resources :lecon
  end
end
