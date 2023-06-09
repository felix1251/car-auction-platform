require "application_system_test_case"

class AuctionTransactionsTest < ApplicationSystemTestCase
  setup do
    @auction_transaction = auction_transactions(:one)
  end

  test "visiting the index" do
    visit auction_transactions_url
    assert_selector "h1", text: "Auction transactions"
  end

  test "should create auction transaction" do
    visit auction_transactions_url
    click_on "New auction transaction"

    fill_in "Auction", with: @auction_transaction.auction_id
    fill_in "Price sold", with: @auction_transaction.price_sold
    fill_in "User", with: @auction_transaction.user_id
    click_on "Create Auction transaction"

    assert_text "Auction transaction was successfully created"
    click_on "Back"
  end

  test "should update Auction transaction" do
    visit auction_transaction_url(@auction_transaction)
    click_on "Edit this auction transaction", match: :first

    fill_in "Auction", with: @auction_transaction.auction_id
    fill_in "Price sold", with: @auction_transaction.price_sold
    fill_in "User", with: @auction_transaction.user_id
    click_on "Update Auction transaction"

    assert_text "Auction transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Auction transaction" do
    visit auction_transaction_url(@auction_transaction)
    click_on "Destroy this auction transaction", match: :first

    assert_text "Auction transaction was successfully destroyed"
  end
end
