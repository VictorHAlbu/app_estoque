class CreateReceitas < ActiveRecord::Migration[6.0]
  def change
    create_table :receitas do |t|
      t.string :despesas
      t.string :nome
      t.string :descricao
      t.string :valor

      t.timestamps
    end
  end
end
