Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :user, only: [:create, :show] do
    post :authenticate_user
  end
end
