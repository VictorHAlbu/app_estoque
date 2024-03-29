require 'sidekiq/web'

Rails.application.routes.draw do
  scope path_names: { new: "novo", edit: "editar" } do
    # seus resources
  end

  #sidekiq
  mount Sidekiq::Web => '/sidekiq'

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
  resources :xml_products do
    collection {post :import }
  end

  root to:'home#index'
end
