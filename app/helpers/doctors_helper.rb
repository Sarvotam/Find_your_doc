module DoctorsHelper
 def fast
      if current_user.doctor.nil?
          redirect_to new_doctor_path
      end
    end

end
