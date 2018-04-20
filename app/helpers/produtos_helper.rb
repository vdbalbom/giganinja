module ProdutosHelper
  def nome_fornecedor produto
    return produto.fornecedor.nome if produto.fornecedor
    "none"
  end
end
