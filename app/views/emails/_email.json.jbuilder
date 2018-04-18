json.extract! email, :id, :endereco_email, :referencia, :fornecedor_id, :created_at, :updated_at
json.url email_url(email, format: :json)
