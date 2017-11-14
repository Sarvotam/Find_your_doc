Rails.application.routes.draw do
     
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/help'

  get 'static_pages/faq'

  get 'static_pages/blog'

   resources :doctors
  resources :reviews
  devise_for :users
         root to: "reviews#index"
   resources :qualifications
   resources :hospital_affiliations
   resources :profiles
   resources :time_schedules
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
