class AddEmailToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :email, :string
  end
end
