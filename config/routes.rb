Rails.application.routes.draw do
  root  'scouts#index'
  get   '/auth/:provider/callback', to: 'sessions#create'
  get   '/logout',                  to: 'sessions#destroy'
  get   '/heart/:photo',            to: 'scouts#heart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :scouts
end
