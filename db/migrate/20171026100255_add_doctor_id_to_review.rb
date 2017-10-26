class AddDoctorIdToReview < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :doctor, index: true
  end
end
