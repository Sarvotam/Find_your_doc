class TimeSchedule < ApplicationRecord
  belongs_to :hospital_affiliation
  belongs_to :doctor
  # has_many :appointments
end
