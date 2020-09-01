class BuyersController < ApplicationController
  def create
    @buyer = Buyer.create(buyer_params)
  end
end
