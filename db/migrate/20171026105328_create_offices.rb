class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.time :time_slot_per_patient_in_minute
      t.integer :first_consultation_fee
      t.integer :followup_consultation_fee
      t.string :name
      t.string :contact
      t.integer :room_number
      t.references :doctor, index: true
      t.references :hospital_affiliation, index: true

      t.timestamps
    end
  end
end
