class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :movie,    null: false, foreign_key: true
      t.string     :user,     null: false
      t.integer    :stars,    null: false
      t.text       :review,   null: false

      t.timestamps
    end

    add_index :reviews, :stars
  end
end
