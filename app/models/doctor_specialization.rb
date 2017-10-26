class DoctorSpecialization < ApplicationRecord
  belongs_to :doctor
  has_many :specializations
  
end
