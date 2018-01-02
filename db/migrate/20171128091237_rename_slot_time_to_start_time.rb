class RenameSlotTimeToStartTime < ActiveRecord::Migration[5.0]
  def change
  	  	 rename_column :time_schedules, :slot_time, :start_time
  end
end
