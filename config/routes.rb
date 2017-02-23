Rails.application.routes.draw do
  get 'first_step/index'

  root 'first_step#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
