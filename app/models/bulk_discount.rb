class BulkDiscount < ApplicationRecord
  validates_presence_of :threshold, :percent_discount
  belongs_to :merchant
end
