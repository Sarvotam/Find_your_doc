module ApplicationHelper
	    def doctor_authentication
        if current_user.user_type == "patient"
          redirect_to root_path
        else
          if !current_user.doctor.nil? && current_user.doctor.profile_confirmation == false 
              flash[:notice] = "wait wait"
              redirect_to doctors_path
          end
      end
    end
end
