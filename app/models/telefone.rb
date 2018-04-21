class Telefone < ApplicationRecord
  belongs_to :fornecedor
  validates :ddd, presence: true
  validates :numero, presence: true
end
