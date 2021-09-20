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
  resources :produtos do
    collection { post :import }
  end
  resources :clientes
  resources :xml_products

  root to:'home#index'
end
