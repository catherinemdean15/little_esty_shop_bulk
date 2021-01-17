class Merchant::BulkDiscountsController < ApplicationController
  before_action :find_merchant
  before_action :find_bulk_discount, only: [:show, :edit, :update]

  def index
    @bulk_discounts = @merchant.bulk_discounts
  end

  def destroy
    BulkDiscount.destroy(params[:id])
    redirect_to merchant_bulk_discounts_path(@merchant)
  end

  def show

  end

  def edit

  end

  def update
    @bulk_discount.update(bulk_discount_params)
    redirect_to merchant_bulk_discount_path(@merchant, @bulk_discount)
  end

  private

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_bulk_discount
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def bulk_discount_params
    params.require(:bulk_discount).permit(:threshold, :percent_discount)
  end

end
