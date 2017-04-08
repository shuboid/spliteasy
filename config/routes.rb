Rails.application.routes.draw do
   devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

    root "events#index"

    resources :events do
      get :balance, on: :collection
    end

    resources :users do
      post :add_transction, on: :collection
      put :add_friend, on: :collection
      get :get_friends, on: :collection
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
