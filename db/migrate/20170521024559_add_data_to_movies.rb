class AddDataToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :image_url, :string
    add_column :movies, :rating, :integer
  end
end
