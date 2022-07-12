Rails.application.routes.draw do

  scope module: :public do
    get '/' => 'homes#top'
    get "about" => "homes#about", as: "about"
    get "customers/my_page" => "customers#show"
    get "customers/edit" => "customers#edit"
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    put 'withdraw' => 'customers#withdraw'
    resource :customers, only: [:update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :addresses, :items, :cart_items
    resources :orders, except: [:show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/compleate' => 'orders#compleate'
    get 'orders/:id' => 'orders#show'



  end

  namespace :admin do
    get '/' => 'homes#top'
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'orders/show'
    resources :homes, :genres, :items, :customers
  end


# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

end
