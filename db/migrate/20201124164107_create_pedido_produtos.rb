class CreatePedidoProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedido_produtos do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.float :valor

      t.timestamps
    end
  end
end
