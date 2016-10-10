Rails.application.routes.draw do

  root :to => "fridges#index"
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users do
    resources :fridges do
      resources :fridge_items do
        member do
          patch :item_used
        end
      end
    end
  end
  # root "fridges#index"

end
