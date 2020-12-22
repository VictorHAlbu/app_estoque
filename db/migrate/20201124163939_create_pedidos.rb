class CreatePedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.float :valor_total

      t.timestamps
    end
  end
end
