class DoctorSpecialization < ApplicationRecord
  has_many :doctor
  has_many :specializations
  
end
