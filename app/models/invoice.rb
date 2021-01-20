class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :merchant_id,
                        :customer_id
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :bulk_discounts, through: :merchant

  enum status: [:cancelled, :in_progress, :complete]

  def initialize(attributes={})
    super
    @count = 0
  end

  def total_revenue_with_discounts
    @bd = self.bulk_discounts.order(:threshold)
    if @bd.length
      @bd.map do |discount|
        invoice_items.select("invoice_items.item_id, sum(invoice_items.quantity) as total_q")
                                          .group(:item_id)
                                          .having('sum(invoice_items.quantity) >= ?', discount.threshold)
                                          .each do |discountable_item|
          discountable_item.discount_unit_price(discount.percent_discount)
        end
      end
      total_revenue
    else
      total_revenue
    end
  end

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def update_invoice_items_discount
    invoice_items.each do |invoice_item|
      if invoice_item.has_discount? == true
        invoice_item.update_column(:discount, invoice_item.find_discount_amount)
      end
    end
  end

end
