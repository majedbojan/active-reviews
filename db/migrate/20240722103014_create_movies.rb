class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.text    :description,      null: false
      t.integer :year,             null: false
      t.string  :name,             null: false
      t.string  :director,         null: false
      t.string  :actor,            null: false
      t.string  :country,          null: false
      t.string  :filming_location, null: false

      t.timestamps
    end

    add_index :movies, :actor
  end
end
