class AddUrlToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :url, :string
  end
end
