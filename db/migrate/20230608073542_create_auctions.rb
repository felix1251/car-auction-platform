class CreateAuctions < ActiveRecord::Migration[7.0]
  def change
    create_table :auctions do |t|
      t.string :brand, null: false
      t.string :car_type, null: false
      t.string :year, null: false
      t.integer :opening_price, null: false
      t.integer :price_increment, null: false
      t.datetime :expired_at, null: false
      t.references :user, index: true
      t.integer :price_hold, default: 0
      t.integer :bid_count, default: 0

      t.timestamps
    end
  end
end
