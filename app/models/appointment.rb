class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  belongs_to :time_schedule
end
