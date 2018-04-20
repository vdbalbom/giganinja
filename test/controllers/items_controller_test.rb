require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    f = Fornecedor.new(nome: "My String")
    f.save
    t = Transportadora.new(nome: "My String")
    t.save
    prod = Produto.new(nome: "My String", fornecedor_id: f.id)
    prod.save
    ped = Pedido.new(transportadora_id: t.id)
    ped.save
    @item = items(:one)
    @item.produto_id = prod.id
    @item.pedido_id = ped.id
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { pedido_id: @item.pedido_id, produto_id: @item.produto_id, quantidade: @item.quantidade, valor: @item.valor } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { pedido_id: @item.pedido_id, produto_id: @item.produto_id, quantidade: @item.quantidade, valor: @item.valor } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
