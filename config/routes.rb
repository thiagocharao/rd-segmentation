Rails.application.routes.draw do
  root :to => "contact_segmentations#index", :id => '1'
  resources :contact_segmentations
  resources :contacts
end
