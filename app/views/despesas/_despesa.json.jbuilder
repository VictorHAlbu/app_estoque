json.extract! despesa, :id, :nome, :descricao, :valor, :created_at, :updated_at
json.url despesa_url(despesa, format: :json)
