class CreateTelefones < ActiveRecord::Migration[5.2]
  def change
    create_table :telefones do |t|
      t.string :ddd
      t.string :numero
      t.string :referencia
      t.integer :fornecedor_id

      t.timestamps
    end
  end
end
