Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resource :developers

  get 'static/(:action)', controller: :static, defaults: { action: 'index' }

end
