Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    # only allow the json format request by specifying the format in the constraints option
    scope module: :v1, :format => true, :constraints => { :format => 'json' } do
      post   "/login"       => "sessions#create"
      delete "/logout"      => "sessions#destroy"

      resources :users do
        collection do
          get :topics
        end 
      end
      resources :topics
    end
  end
end
