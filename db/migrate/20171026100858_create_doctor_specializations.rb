class CreateDoctorSpecializations < ActiveRecord::Migration[5.0]
  def change
    create_table :doctor_specializations do |t|
      t.string :name
      t.references :doctor, index: true

      t.timestamps
    end
  end
end
