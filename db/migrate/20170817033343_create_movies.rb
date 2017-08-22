class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :average_rating
      t.integer :num_ratings
    end
  end
end
