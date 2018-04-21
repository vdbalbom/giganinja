class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
  validates_numericality_of :quantidade, greater_than: 0
  validates_numericality_of :valor

  def subtotal
    self.quantidade*self.valor
  end
end
