class CreateAuctionTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :auction_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :auction, null: false, foreign_key: true
      t.integer :price_sold, null: false

      t.timestamps
    end
  end
end
