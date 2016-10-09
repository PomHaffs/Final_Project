Rails.application.routes.draw do

  resources :fridges do
    resources :fridge_items
  end

  root "fridges#index"

end
