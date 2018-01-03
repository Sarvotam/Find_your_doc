class Qualification < ApplicationRecord
  belongs_to :doctor
  validates :doctor_id, uniqueness: true
end
