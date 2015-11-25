class CreateGiftees < ActiveRecord::Migration
  def change
    create_table :giftees do |t|
      t.string :name
      t.integer :age
      t.string :likes
      t.string :dislikes

      t.timestamps null: false
    end
  end
end
