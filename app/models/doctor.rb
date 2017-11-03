class Doctor < ApplicationRecord
	belongs_to :user
	validates_uniqueness_of :user_id
	has_many :reviews
	has_many :time_schedules
	has_many :hospital_affiliations
	has_many :qualifications
	has_many :doctor_specializations
	has_many :offices
end
