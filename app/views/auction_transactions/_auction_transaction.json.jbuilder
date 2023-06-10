json.extract! auction_transaction, :id, :user_id, :auction_id, :price_sold, :created_at, :updated_at
json.url auction_transaction_url(auction_transaction, format: :json)
