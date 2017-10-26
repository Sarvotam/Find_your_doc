class HospitalAffiliation < ApplicationRecord
  belongs_to :doctor
  has_many :time_schedules
  has_many :offices
    # has_many :offices

end
