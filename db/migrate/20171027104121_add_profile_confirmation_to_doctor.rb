class AddProfileConfirmationToDoctor < ActiveRecord::Migration[5.0]
  def change
  	add_column :doctors, :profile_confirmation, :boolean, index: true, :default => false
  end
end
