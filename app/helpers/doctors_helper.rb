module DoctorsHelper
   def doctor
    # binding.pry
        if  current_user.user_type == "doctor" 
              flash[:notice] = "you r doctors"
             'doctor/new'
         else
          flash[:notice] = "you r patient"
          redirect_to root_path
        end
    end 
end
