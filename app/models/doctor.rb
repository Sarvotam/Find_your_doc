class Doctor < ApplicationRecord
	belongs_to :user
	validates_uniqueness_of :user_id
	has_many :reviews
	has_many :time_schedules, dependent: :destroy
	has_many :hospital_affiliations, dependent: :destroy
	has_one :qualification, dependent: :destroy
	has_many :doctor_specializations, dependent: :destroy
	has_many :offices, dependent: :destroy
	has_attached_file :profile_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :profile_image, content_type: /\Aimage\/.*\z/
end
