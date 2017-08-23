Rails.application.routes.draw do
  get 'articles/:id', to:'articles#show', as: :article
  get 'sport', to: 'articles#sport'
  get 'economy', to: 'articles#economy'
  get 'search_results/:id', to: 'articles#search_results'
  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
