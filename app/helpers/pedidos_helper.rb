module PedidosHelper
  def nome_transportadora pedido
    return pedido.transportadora.nome if pedido.transportadora
    "none"
  end
end
