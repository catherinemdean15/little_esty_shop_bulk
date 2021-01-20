class Merchant::BulkDiscountsController < ApplicationController
  before_action :find_merchant
  before_action :find_bulk_discount, only: [:show, :edit, :update]

  def index
    @bulk_discounts = @merchant.bulk_discounts
  end

  def new

  end

  def create
    @bulk_discount = @merchant.bulk_discounts.new(create_bulk_discount_params)
    if @bulk_discount.save
      redirect_to merchant_bulk_discounts_path(@merchant)
    else
      flash.notice = "All fields must be completed."
      redirect_to new_merchant_bulk_discount_path(@merchant)
    end
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
    if @bulk_discount.update(bulk_discount_params)
      redirect_to merchant_bulk_discount_path(@merchant, @bulk_discount)
    else
      flash.notice = "All fields must be completed."
      redirect_to edit_merchant_bulk_discount_path(@merchant, @bulk_discount)
    end
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

  def create_bulk_discount_params
    params.permit(:threshold, :percent_discount)
  end

end
