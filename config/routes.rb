Rails.application.routes.draw do
  root "whatsapps#index"
  resources :whatsapps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
