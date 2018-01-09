class Review < ApplicationRecord
	# validates :doctor_id, uniqueness: { scope: :user_id, message: "You've reviewed this movie!" }
	validates :overall_rating, :bedside_manner_rating, :review, presence: true
	belongs_to :doctor
	belongs_to :user

end
