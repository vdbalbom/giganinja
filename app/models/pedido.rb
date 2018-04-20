class Pedido < ApplicationRecord
  belongs_to :transportadora
  has_many :items, dependent: :delete_all

  # TODO: write this method
  def valor_total
    return 0
  end
end
