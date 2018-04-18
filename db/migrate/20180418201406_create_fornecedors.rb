class CreateFornecedors < ActiveRecord::Migration[5.2]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :descricao
      t.string :cidade
      t.string :endereco
      t.string :bairro
      t.integer :numero

      t.timestamps
    end
  end
end
