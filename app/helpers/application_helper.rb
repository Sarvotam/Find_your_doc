module ApplicationHelper
	def doctor_authentication
        if current_user.user_type == "patient"
          redirect_to root_path
          flash[:notice] = "you r not a doctor"
        else
            if !current_user.doctor.nil? 
                if current_user.doctor.profile_confirmation == false
                    flash[:notice] = "doctor pending"
                    redirect_to root_path
                end
            end
          end
      end
 def user_type_validate
        if  current_user.user_type == "doctor" 
           if !current_user.doctor.nil? 
              flash[:notice] = "you doctors"
              redirect_to root_path
           end
         else
          flash[:notice] = "you r patient"
          redirect_to root_path
        end
    end 
      
end
