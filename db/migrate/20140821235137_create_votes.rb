class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :voted_movie_id

      t.timestamps
    end
    add_index :votes, :voter_id
    add_index :votes, :voted_movie_id
    add_index :votes, [:voted_movie_id, :voter_id], unique: true
  end
end
