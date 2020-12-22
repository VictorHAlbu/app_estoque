json.extract! receita, :id, :despesas, :nome, :descricao, :valor, :created_at, :updated_at
json.url receita_url(receita, format: :json)
