class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false, index: true
      t.text :plot

      t.timestamps null: false
    end
  end
end
