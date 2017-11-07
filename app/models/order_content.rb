class OrderContent < ApplicationRecord
  belongs_to :order
  belongs_to :item
  has_one :state, through: :order
end
