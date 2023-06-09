class CreateAuctions < ActiveRecord::Migration[7.0]
  def change
    create_table :auctions do |t|
      t.string :brand, null: false
      t.string :year, null: false
      t.integer :opening_price, null: false
      t.integer :price_increment, null: false
      t.datetime :expired_at, null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
