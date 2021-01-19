class InvoiceItem < ApplicationRecord
  validates_presence_of :invoice_id,
                        :item_id,
                        :quantity,
                        :unit_price,
                        :status

  belongs_to :invoice
  belongs_to :item

  enum status: [:pending, :packaged, :shipped]

  def self.incomplete_invoices
    Invoice.joins(:invoice_items)
           .where("invoice_items.status = 0 or invoice_items.status = 1")
           .order(:created_at)
           .distinct
  end

  def discount_unit_price(percent_discount)
    invoice_items = InvoiceItem.where(item_id: self.item_id)
    invoice_items.each do |invoice_item|
      invoice_item.update_column(:unit_price, (self.item.unit_price - (self.item.unit_price * (percent_discount * 0.01))))
    end
  end
end
