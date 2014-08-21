class RenameUserPwToPassword < ActiveRecord::Migration
  def change
    rename_column :users, :pw, :password
  end
end
