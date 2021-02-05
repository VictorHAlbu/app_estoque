class AddColunmReceitas < ActiveRecord::Migration[6.0]
  def change
    add_column :receitas, :valor, :float
  end
end
