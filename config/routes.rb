Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # only allow the json format request by specifying the format in the constraints option
  scope :format => true, :constraints => { :format => 'json' } do
    post   "/login"       => "sessions#create"
    delete "/logout"      => "sessions#destroy"
  end
end
