class AddAdminToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :admin, :boolean, index:true, :default => false
  end
end
