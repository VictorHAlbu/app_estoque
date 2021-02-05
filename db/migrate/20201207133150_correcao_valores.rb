class CorrecaoValores < ActiveRecord::Migration[6.0]
  def change
    remove_column :despesas, :valor
    remove_column :receitas, :valor
  end
end
