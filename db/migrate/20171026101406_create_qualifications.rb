class CreateQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.text :qualification_name
      t.string :institute_name
      t.string :language
      t.text :board_certification
      t.date :procurement_year
      t.references :doctor, index: true

      t.timestamps
    end
  end
end
