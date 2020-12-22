Rails.application.routes.draw do
  scope path_names: { new: "novo", edit: "editar" } do
    # seus resources
  end
  resources :pedidos do 
    resources :pedido_produtos
  end
  resources :receitas
  resources :despesas
  resources :fornecedores
  resources :produtos
  resources :clientes
  root to:'home#index'
end
