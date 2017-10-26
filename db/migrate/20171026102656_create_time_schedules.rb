class CreateTimeSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :time_schedules do |t|
      t.time :slot_time
      t.date :slot_date
      t.string :day_of_week
      t.references :hospital_affiliation, index: true
      t.references :doctor, index: true

      t.timestamps
    end
  end
end
