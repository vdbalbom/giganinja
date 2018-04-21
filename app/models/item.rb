class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
  validates_numericality_of :quantidade, greater_than: 0
  validates :valor, presence: true

  def subtotal
    self.quantidade*self.valor
  end
end
