class AddGifteeIdColumn < ActiveRecord::Migration
  def change
    add_column :wishlists, :giftee_id, :integer
  end
end
