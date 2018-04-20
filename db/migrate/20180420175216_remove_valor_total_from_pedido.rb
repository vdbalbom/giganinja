class RemoveValorTotalFromPedido < ActiveRecord::Migration[5.2]
  def change
    remove_column :pedidos, :valor_total
  end
end
