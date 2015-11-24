class ChangeOwnerColumn < ActiveRecord::Migration
  def change
    rename_column :accounts, :owner, :user_login
  end
end
