Rails.application.routes.draw do
  get 'articles/:id', to:'articles#show', as: :article
  get 'sport', to: 'articles#sport'
  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
