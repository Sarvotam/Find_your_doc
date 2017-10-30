class ApplicationController < ActionController::Base
	 # before_filter :check_role, only: [:create]
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
 # protected
 #  def configure_permitted_parameters
 #  	devise_parameter_sanitizer(:sign_up) do |u| 
 #  		u.permit(:username, :email, :password, :password_confirmation, :remember_me) 
 #  	end
 #  	devise_parameter_sanitizer(:sign_in) do |u| 
 #  		u.permit(:username, :email, :password, :password_confirmation, :remember_me) 
 #  	end
 #  	devise_parameter_sanitizer(:account_update) do |u| 
 #  		u.permit(:username, :email, :password, :password_confirmation, :remember_me) 
 #  	end
 #  end


  def configure_permitted_parameters
    added_attrs = [:first_name, :Last_name,:username, :contact_number, :address, :date_of_birth, :gender, :email, :password, :password_confirmation, :remember_me, :user_type]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
<<<<<<< HEAD



def check_role
  # if params[:user][:user_type] == 'doctor'
  #   redirect_to new_doctor_path
  # # elsif [:user][:user_type] == 'patient'
  # #   redirect_to user_path
  # end
end
=======
  
 
>>>>>>> 866ee8d8379c7a06ace0f9afbdfd435d8e5e4bf3
 
end
