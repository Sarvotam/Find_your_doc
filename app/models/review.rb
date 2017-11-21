class Review < ApplicationRecord
	validates :doctor_id, uniqueness: { scope: :user_id, message: "You've reviewed this movie!" }
	belongs_to :doctor
	belongs_to :user

end
