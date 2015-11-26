class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :item
      t.integer :price
      t.boolean :bought

      t.timestamps null: false
    end
  end
end
