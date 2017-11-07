class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_contents
  belongs_to :customer
  belongs_to :state
  has_many :items, through: :order_contents
  after_initialize :def_values

  self.per_page = 10
  def def_values
    logger.warn("DEFVALUES DEF VALUES")
    @orderstatus = OrderStatus.find_by(status: 'Placed')
    logger.warn(@orderstatus)

    self.order_status ||= @orderstatus
  end

end
