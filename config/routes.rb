Rails.application.routes.draw do

  root 'public/homes#top'
  get "about" => "public/homes#about", as: "about"

  scope module: :public do
    get "customers/my_page" => "customers#show"
    get "customers/edit" => "customers#edit"
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    put 'withdraw' => 'customers#withdraw'
    resource :customers, only: [:update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :addresses, :items, :cart_items
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/compleate' => 'orders#compleate'
    resources :orders



  end

  namespace :admin do
    get '/' => 'homes#top'
    get 'orders/:id' => 'orders#show',as:'order'
    patch 'orders/:id' => 'orders#update'
    patch 'orders/:order_id/order_details/:id' => 'order_details#update', as: 'order_detail'
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
