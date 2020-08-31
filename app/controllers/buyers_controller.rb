class BuyersController < ApplicationController
  def create
    binding.pry
    @buyer = Buyer.create(buyer_params)
  end
end
