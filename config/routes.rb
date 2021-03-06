Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    # only allow the json format request by specifying the format in the constraints option
    scope module: :v1, :format => true, :constraints => { :format => 'json' } do
      post   "/login"       => "sessions#create"
      delete "/logout"      => "sessions#destroy"
      post "/signup"		=> "users#create"
      resources :users do
        member do
          get :topics
        end
      end
      resources :topics do
        member do
          get :users
        end
      end
    end
  end
end
