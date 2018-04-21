class Fornecedor < ApplicationRecord
  has_many :produtos
  has_many :telefones, dependent: :delete_all
  has_many :emails, dependent: :delete_all
  validates :nome, presence: true
  validates :endereco, presence: true
  validates :cidade, presence: true
  validates :bairro, presence: true
  validates :numero, presence: true
end
