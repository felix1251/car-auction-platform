require "test_helper"

class AuctionTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auction_transaction = auction_transactions(:one)
  end

  test "should get index" do
    get auction_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_auction_transaction_url
    assert_response :success
  end

  test "should create auction_transaction" do
    assert_difference("AuctionTransaction.count") do
      post auction_transactions_url, params: { auction_transaction: { auction_id: @auction_transaction.auction_id, price_sold: @auction_transaction.price_sold, user_id: @auction_transaction.user_id } }
    end

    assert_redirected_to auction_transaction_url(AuctionTransaction.last)
  end

  test "should show auction_transaction" do
    get auction_transaction_url(@auction_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_auction_transaction_url(@auction_transaction)
    assert_response :success
  end

  test "should update auction_transaction" do
    patch auction_transaction_url(@auction_transaction), params: { auction_transaction: { auction_id: @auction_transaction.auction_id, price_sold: @auction_transaction.price_sold, user_id: @auction_transaction.user_id } }
    assert_redirected_to auction_transaction_url(@auction_transaction)
  end

  test "should destroy auction_transaction" do
    assert_difference("AuctionTransaction.count", -1) do
      delete auction_transaction_url(@auction_transaction)
    end

    assert_redirected_to auction_transactions_url
  end
end
