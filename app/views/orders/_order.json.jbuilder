json.extract! order, :id, :total, :notes, :customer, :order_status_id, :created_at, :updated_at
json.url order_url(order, format: :json)
