Rails.application.routes.draw do

  root :to => "session#new"
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/users/:user_id/fridges/:fridge_id/display' => 'fridges#display', :as => "fridge_display"

  get '/users/:user_id/fridges/:fridge_id/send_recipe' => 'fridges#recipe_email', :as => "recipe_email"

  resources :users do
    resources :fridges do
      resources :fridge_items do
        member do
          patch :item_used
        end
      end
    end
  end

end
