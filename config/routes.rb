Rails.application.routes.draw do
  get 'articles/:id', to:'articles#show', as: :article

  root 'articles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
