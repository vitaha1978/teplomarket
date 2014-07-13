json.array!(@orders) do |order|
  json.extract! order, :id, :name, :phone, :email, :pay_type
  json.url order_url(order, format: :json)
end
