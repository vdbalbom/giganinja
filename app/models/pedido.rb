class Pedido < ApplicationRecord
  belongs_to :transportadora
  has_many :items
end
