class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :telefone
      t.string :string
      t.string :email

      t.timestamps
    end
  end
end
