class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :appointment_status
      t.text :cancellation_reason
      t.text :health_history
      t.references :doctor, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
