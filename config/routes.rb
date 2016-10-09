Rails.application.routes.draw do

  resources :fridges do
    resources :fridge_items do
      member do
        patch :item_used
      end
    end
  end

  root "fridges#index"

end
