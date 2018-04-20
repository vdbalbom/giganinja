module PedidosHelper
  def nome_transportadora pedido
    return pedido.transportadora.name if pedido.transportadora
    "none"
  end
end
