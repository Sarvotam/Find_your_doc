module ApplicationHelper
	def doctor_authentication
    # binding.pry
        if current_user.user_type == "patient"
          redirect_to root_path
          flash[:notice] = "you r not a doctor"
        else
            if !current_user.doctor.nil? 
                if current_user.doctor.profile_confirmation == false
                    flash[:notice] = "doctor pending"
                    redirect_to root_path
                end
            else
              flash[:notice] = "fill the form"
              redirect_to root_path
          end
      end
    end
end
