Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
    get "home/about" => "homes#about", as: "about"
  end

  namespace :admin do
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
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

namespace :admin do
  resources :genres, :items
end

namespace :public do
  resources :homes
end

end
