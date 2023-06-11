json.extract! auction, :id, :brand, :year, :opening_price, :price_increment, :expired_at, :created_at, :updated_at, :image, :car_type
json.url auction_url(auction, format: :json)
