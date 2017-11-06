class RenameAffiliationToHospitalAffiliation < ActiveRecord::Migration[5.0]
  def change
  	 rename_column :hospital_affiliations, :affilation, :affiliation
  end
end
