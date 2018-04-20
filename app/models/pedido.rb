class Pedido < ApplicationRecord
  belongs_to :transportadora
  has_many :items

  # TODO: write this method
  def valor_total
    return 0
  end
end
