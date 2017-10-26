class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :Last_name, :string
    add_column :users, :contact_number, :string
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :integer
    add_column :users, :user_type, :integer
  end
end
