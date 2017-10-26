class CreateHospitalAffiliations < ActiveRecord::Migration[5.0]
  def change
    create_table :hospital_affiliations do |t|
      t.string :affilation
      t.string :city
      t.string :country
      t.date :start_date
      t.string :contact
      t.string :address
      t.references :doctor, index: true

      t.timestamps
    end
  end
end
