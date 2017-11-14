class Doctor < ApplicationRecord
	belongs_to :user
	validates_uniqueness_of :user_id
	has_many :reviews
	has_many :time_schedules, dependent: :destroy
	has_many :hospital_affiliations, dependent: :destroy
	has_many :qualifications, dependent: :destroy
	has_many :doctor_specializations, dependent: :destroy
	has_many :offices, dependent: :destroy
end
