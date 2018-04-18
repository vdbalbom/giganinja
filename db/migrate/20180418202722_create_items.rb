class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.float :valor
      t.float :quantidade
      t.integer :produto_id
      t.integer :pedido_id

      t.timestamps
    end
  end
end
