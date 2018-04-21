class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
  validates :quantidade, presence: true   # TODO: quantidade > 0
  validates :valor, presence: true

  def subtotal
    self.quantidade*self.valor
  end
end
