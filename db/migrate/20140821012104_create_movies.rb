class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :preview
      t.text :full_script

      t.timestamps
    end
  end
end
