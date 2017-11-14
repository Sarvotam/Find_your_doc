module DoctorsHelper
   def doctor
        if  current_user.user_type == "doctor" 
           if !current_user.doctor.nil? 
              flash[:notice] = "you r doctors"
              redirect_to root_path
           end
         else
          flash[:notice] = "you r patient"
          redirect_to root_path
        end
    end 
end
