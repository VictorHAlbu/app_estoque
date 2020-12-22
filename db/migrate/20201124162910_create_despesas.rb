class CreateDespesas < ActiveRecord::Migration[6.0]
  def change
    create_table :despesas do |t|
      t.string :nome
      t.string :descricao
      t.string :valor

      t.timestamps
    end
  end
end
