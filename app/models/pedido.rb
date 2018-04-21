class Pedido < ApplicationRecord
  belongs_to :transportadora
  has_many :items, dependent: :delete_all
  validates :data, presence: true
  validates :hora, presence: true
  validates :nota_fiscal, presence: true
  validates :valor_frete, presence: true
  validates :desconto, presence: true

  # TODO: write this method
  def valor_total
    return 0
  end
end
