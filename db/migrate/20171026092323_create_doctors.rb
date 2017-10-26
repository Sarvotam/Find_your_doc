class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
    t.text :professional_statement
    t.date :practicing_from
    t.string :profile_image
    t.string :certificate_image
    t.integer :fax_number
    t.boolean :award
    t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :doctors, :user
  end
end
