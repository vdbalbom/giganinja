require 'test_helper'

class FornecedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fornecedor = fornecedors(:one)
  end

  test "should get index" do
    get fornecedors_url
    assert_response :success
  end

  test "should get new" do
    get new_fornecedor_url
    assert_response :success
  end

  test "should create fornecedor" do
    assert_difference('Fornecedor.count') do
      post fornecedors_url, params: { fornecedor: { bairro: @fornecedor.bairro, cidade: @fornecedor.cidade, descricao: @fornecedor.descricao, endereco: @fornecedor.endereco, nome: @fornecedor.nome, numero: @fornecedor.numero },
                                      telefone: [{"ddd" => "22", "numero" => "1234 5678", "referencia" => ""}] }
    end

    assert_redirected_to fornecedor_url(Fornecedor.last)
  end

  test "should show fornecedor" do
    get fornecedor_url(@fornecedor)
    assert_response :success
  end

  test "should get edit" do
    get edit_fornecedor_url(@fornecedor)
    assert_response :success
  end

  test "should update fornecedor" do
    patch fornecedor_url(@fornecedor), params: { fornecedor: { bairro: @fornecedor.bairro, cidade: @fornecedor.cidade, descricao: @fornecedor.descricao, endereco: @fornecedor.endereco, nome: @fornecedor.nome, numero: @fornecedor.numero },
                                                 telefone: [{"ddd" => "22", "numero" => "1234 5678", "referencia" => ""}] }
    assert_redirected_to fornecedor_url(@fornecedor)
  end

  test "should destroy fornecedor" do
    assert_difference('Fornecedor.count', -1) do
      delete fornecedor_url(@fornecedor)
    end

    assert_redirected_to fornecedors_url
  end
end
