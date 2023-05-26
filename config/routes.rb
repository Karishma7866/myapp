Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :users        .....isme 7 routes work karti nh
  #resources :users only: [:create, :destroy]        .......isme srif create n destroy hi work karegi
  resources :users do
    member do  
      get :orders_by_user #it works on single id 
    end
    collection do
      post :bulk_orders_delete
    end

  end

  resources :profiles
  resources :books do
    member do
      put :publish_book
    end
    collection do
      get :all_publish_book
      get :all_draft_book
    end
  end
  resources :orders, only: [:index] do
    collection do
      post :create_order
    end
    member do
      get :show_order
      put :update_order
      delete :destroy_order
    end
  end
  resources :comments
  resources :poly1s
  resources :poly2s
  resources :poly3s
  resources :relates
  

end
