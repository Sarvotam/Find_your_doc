class Office < ApplicationRecord
  belongs_to :doctor
  belongs_to :hospital_affiliation
end
