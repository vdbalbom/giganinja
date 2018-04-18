class Produto < ApplicationRecord
  has_many :items
  belongs_to :fornecedor
end
