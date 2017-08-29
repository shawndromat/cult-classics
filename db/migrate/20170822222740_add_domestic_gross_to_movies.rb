class AddDomesticGrossToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :domestic_gross, :integer
  end
end
