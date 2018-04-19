class Fornecedor < ApplicationRecord
  has_many :produtos
  has_many :telefones, dependent: :delete_all
  has_many :emails
end
