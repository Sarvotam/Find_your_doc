module ApplicationHelper
	 def validate_user
      if !current_user.doctor.nil?
         unless current_user.doctor.profile_confirmation == true
           redirect_to root_path
        end
      else
           redirect_to root_path        
      end
    end
end
