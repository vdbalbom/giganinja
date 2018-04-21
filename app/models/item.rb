class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  def subtotal
    self.quantidade*self.valor
  end
end
