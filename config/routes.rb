Rails.application.routes.draw do

root to: "reviews#index"
     
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/help'

  get 'static_pages/faq'

  get 'static_pages/blog'

   resources :doctors
  resources :reviews
  devise_for :users, controllers: {
    registrations:'users/registrations',
    sessions: 'users/sessions'
  }
   resources :qualifications
   resources :hospital_affiliations
   resources :profiles
   resources :time_schedules
   resources :appointments
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
