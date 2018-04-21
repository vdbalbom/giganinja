class Pedido < ApplicationRecord
  belongs_to :transportadora
  has_many :items, dependent: :delete_all
  validates :data, presence: true
  validates :hora, presence: true
  validates :nota_fiscal, presence: true
  validates_numericality_of :valor_frete
  validates_numericality_of :desconto

  def valor_total
    # TODO: write tests for this method
    total = 0.0
    self.items.each {|item| total += item.subtotal}
    total += self.valor_frete
    total -= self.desconto
    return total
  end
end
