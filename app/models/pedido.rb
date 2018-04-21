class Pedido < ApplicationRecord
  belongs_to :transportadora
  has_many :items, dependent: :delete_all
  validates :data, presence: true
  validates :hora, presence: true
  validates :nota_fiscal, presence: true
  validates :valor_frete, presence: true
  validates :desconto, presence: true

  def valor_total
    total = 0.0
    self.items.each {|item| total += item.subtotal}
    total += self.valor_frete
    total -= self.desconto
    return total
  end
end
