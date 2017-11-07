Rails.application.routes.draw do
  resources :orders, :items
  devise_for :customers
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get '/cart', to: "items#cart", as: "cart"
  get '/checkout', to: "orders#new", as: "check_out"
  get '/cart/remove', to: "items#remove_cookie"
  get '/forbidden', to: 'welcome#forbidden', as: 'forbidden'
  get '/admin', to: "admin#index"

  get '/admin/items', to: "admin#items"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
