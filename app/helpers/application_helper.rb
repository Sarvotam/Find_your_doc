module ApplicationHelper
	def doctor_authentication
    # binding.pry
        if current_user.user_type == "patient"
          redirect_to root_path
          flash[:notice] = "you r not a doctor"
        else
                if current_user.doctor.profile_confirmation == false
                    flash[:notice] = "your account is pending for dr. profile request"
                    '/doctor/new'
               
            # else
            #   flash[:notice] = "fill the form again .. something is missing"
            #   '/doctor/new'
          end
      end

    end
end
