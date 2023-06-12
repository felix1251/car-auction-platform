# class AuctionTransactionsController < ApplicationController
#   before_action :set_auction_transaction, only: %i[ show edit update destroy ]

#   # GET /auction_transactions or /auction_transactions.json
#   def index
#     @auction_transactions = AuctionTransaction.all
#   end

#   # GET /auction_transactions/1 or /auction_transactions/1.json
#   def show
#   end

#   # GET /auction_transactions/new
#   def new
#     @auction_transaction = AuctionTransaction.new
#   end

#   # GET /auction_transactions/1/edit
#   def edit
#   end

#   # POST /auction_transactions or /auction_transactions.json
#   def create
#     @auction_transaction = AuctionTransaction.new(auction_transaction_params)

#     respond_to do |format|
#       if @auction_transaction.save
#         format.html { redirect_to auction_transaction_url(@auction_transaction), notice: "Auction transaction was successfully created." }
#         format.json { render :show, status: :created, location: @auction_transaction }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @auction_transaction.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /auction_transactions/1 or /auction_transactions/1.json
#   def update
#     respond_to do |format|
#       if @auction_transaction.update(auction_transaction_params)
#         format.html { redirect_to auction_transaction_url(@auction_transaction), notice: "Auction transaction was successfully updated." }
#         format.json { render :show, status: :ok, location: @auction_transaction }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @auction_transaction.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /auction_transactions/1 or /auction_transactions/1.json
#   def destroy
#     @auction_transaction.destroy

#     respond_to do |format|
#       format.html { redirect_to auction_transactions_url, notice: "Auction transaction was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_auction_transaction
#       @auction_transaction = AuctionTransaction.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def auction_transaction_params
#       params.require(:auction_transaction).permit(:user_id, :auction_id, :price_sold)
#     end
# end
