json.extract! pedido, :id, :data, :hora, :nota_fiscal, :valor_frete, :desconto, :valor_total, :transportadora_id, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
