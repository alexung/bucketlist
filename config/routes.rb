Rails.application.routes.draw do
  root "lists#index"

  resources :lists do
    resources :items do
      put "complete"
    end
  end

  match 'list/:id/complete' => 'items#complete', :via => :put

  resources :items, :collection => { :complete => :put }


end
