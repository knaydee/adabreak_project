class AddUserToGiftees < ActiveRecord::Migration
  def change
    add_column :giftees, :user_id, :integer
  end
end
