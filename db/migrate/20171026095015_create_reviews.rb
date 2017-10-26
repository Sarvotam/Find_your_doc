class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.float :wait_time_rating
      t.float :bedside_manner_rating
      t.float :overall_rating
      t.text :review
      t.boolean :is_recommended
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :reviews, :user
  end
end
