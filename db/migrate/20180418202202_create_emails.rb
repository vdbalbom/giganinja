class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :endereco_email
      t.string :referencia
      t.integer :fornecedor_id

      t.timestamps
    end
  end
end
