class CreateGenresMovies < ActiveRecord::Migration
  def self.up
    create_table :genres_movies do |t|
      t.integer :movie_id
      t.integer :genre_id
    end
    add_index :genres_movies, :genre_id
    add_index :genres_movies, :movie_id
    add_index :genres_movies, [:genre_id, :movie_id], unique: true
  end
  def self.down
    drop_table :genres_movies
  end
end
