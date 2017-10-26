class CreateSpecializations < ActiveRecord::Migration[5.0]
  def change
    create_table :specializations do |t|
      t.string :name
      t.references :doctor_specialization, index: true

      t.timestamps
    end
  end
end
