class AddColumnToDespesas < ActiveRecord::Migration[6.0]
  def change
    add_column :despesas, :valor, :float
  end
end
