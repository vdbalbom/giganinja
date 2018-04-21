class Transportadora < ApplicationRecord
  has_many :pedidos
  validates :nome, presence: true
end
