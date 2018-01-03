module ApplicationHelper
	def doctor_authentication
    # binding.pry
        if current_user.user_type == "patient"
          flash[:notice] = "you r not a doctor"
           redirect_to root_path
        else
          if current_user.doctor.profile_confirmation == false
                    flash[:notice] = "your account is pending for dr. profile request"
                    '/doctor/new'
        
          end
      end

    end
end
