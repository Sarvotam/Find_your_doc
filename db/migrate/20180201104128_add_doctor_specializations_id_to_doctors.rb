class AddDoctorSpecializationsIdToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_reference :doctors, :doctor_specializations, foreign_key: true
  end
end
