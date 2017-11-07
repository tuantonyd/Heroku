module ReportingHelper

  def self.state_report(state)
  return Order.where(state_id: state).joins(:order_contents).joins(:items).group(:name).sum('order_contents.qty').sort_by {|_key, value| value}.reverse
end

def self.item_popularity
  return OrderContent.select(:qty, :name).joins(:item).group(:name).sum(:qty)
end

def self.unavailable_inventory
 Item.where(available: false)
end

end
