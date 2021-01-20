require 'rails_helper'

describe "merchant bulk discount new" do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @merchant2 = Merchant.create!(name: 'Jewelry')

    @bulk1 = @merchant1.bulk_discounts.create!(threshold: 3, percent_discount: 25)
    @bulk2 = @merchant1.bulk_discounts.create!(threshold: 6, percent_discount: 40)
    @bulk3 = @merchant2.bulk_discounts.create!(threshold: 10, percent_discount: 35)

    visit new_merchant_bulk_discount_path(@merchant1)
  end

  it "can create a bulk discount" do
    fill_in "Threshold", with: "50"
    fill_in "Percent discount", with: "45"

    click_button "Submit"

    expect(current_path).to eq(merchant_bulk_discounts_path(@merchant1))

    expect(page).to have_content("Item Threshold: 50")
    expect(page).to have_content("Percent Discount: 45")

    expect(page).to have_content("Item Threshold: 3")
    expect(page).to have_content("Item Threshold: 6")
    expect(page).to_not have_content("Item Threshold: 10")
  end

end
