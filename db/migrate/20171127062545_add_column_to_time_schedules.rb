class AddColumnToTimeSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :time_schedules, :end_time, :time
  end
end
