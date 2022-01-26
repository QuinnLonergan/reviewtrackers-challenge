class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.string :author
      t.integer :rating
      t.string :date
      t.boolean :closed
      t.string :loantype
      t.string :reviewtype

      t.timestamps
    end
  end
end
