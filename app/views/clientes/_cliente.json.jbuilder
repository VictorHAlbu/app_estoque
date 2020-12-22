json.extract! cliente, :id, :nome, :telefone, :string, :email, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
