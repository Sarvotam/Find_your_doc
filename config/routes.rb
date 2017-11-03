Rails.application.routes.draw do
     
   resources :doctors
  resources :reviews
  devise_for :users
         root to: "reviews#index"
   resources :qualifications
   resources :hospital_affiliations
   resources :profiles
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
