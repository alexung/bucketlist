Rails.application.routes.draw do
  root "lists#index"

  resources :lists do
    resources :items
  end

  match 'list/:id/complete' => 'lists#complete', :via => :post

end
