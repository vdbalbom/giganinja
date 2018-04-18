class Fornecedor < ApplicationRecord
  has_many :produtos
  has_many :telefones
  has_many :emails
end
