class AddTimeSchedulesToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :time_schedule, index:true, foreign_key: true
  end
end
