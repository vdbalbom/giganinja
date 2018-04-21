class Produto < ApplicationRecord
  has_many :items
  belongs_to :fornecedor
  validates :nome, presence: true
end
