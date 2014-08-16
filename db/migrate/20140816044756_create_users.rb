class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :pw
      t.string :email
      t.string :nickname
      t.text :description

      t.timestamps
    end
  end
end
