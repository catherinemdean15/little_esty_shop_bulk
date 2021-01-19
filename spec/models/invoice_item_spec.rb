require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "validations" do
    it { should validate_presence_of :invoice_id }
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :status }
  end
  describe "relationships" do
    it { should belong_to :invoice }
    it { should belong_to :item }
  end
  describe 'instance methods' do
    it "discount_unit_price" do
      @merchant1 = Merchant.create!(name: 'Hair Care')
      @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id, status: 1)
      @item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 10, merchant_id: @merchant1.id)
      @item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 10, merchant_id: @merchant1.id)
      @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
      @invoice_1 = Invoice.create!(merchant_id: @merchant1.id, customer_id: @customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")
      @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 10, unit_price: 10, status: 2)
      @ii_11 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_8.id, quantity: 2, unit_price: 10, status: 1)
      @ii_12 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_8.id, quantity: 3, unit_price: 10, status: 1)
      @ii_13 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 1, unit_price: 10, status: 1)
      @bulk1 = @merchant1.bulk_discounts.create!(threshold: 10, percent_discount: 50)
      @bulk2 = @merchant1.bulk_discounts.create!(threshold: 5, percent_discount: 25)

      expect(@ii_1.discount_unit_price(50).first.unit_price).to eq(5.0)
      expect(@ii_11.discount_unit_price(25).first.unit_price).to eq(7.5)
    end
  end
end
