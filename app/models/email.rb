class Email < ApplicationRecord
  belongs_to :fornecedor
  validates :endereco_email, presence: true
end
