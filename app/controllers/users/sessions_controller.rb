class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super    
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def after_sign_in_path_for(resource)
    if current_user.user_type == "doctor"
      id = current_user.doctor.id
      if current_user.doctor.profile_confirmation == false
        '/doctors/new'
      else
        '/doctors/#{id}'
      end
    elsif current_user.user_type == "patient"
      '/doctors'
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
