class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.date :data
      t.time :hora
      t.string :nota_fiscal
      t.float :valor_frete
      t.float :desconto
      t.float :valor_total
      t.integer :transportadora_id

      t.timestamps
    end
  end
end
