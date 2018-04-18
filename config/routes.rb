Rails.application.routes.draw do
  resources :emails
  resources :telefones
  resources :fornecedors
  resources :pedidos
  resources :transportadoras
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
