require 'test_helper'

class FornecedoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fornecedor = fornecedores(:one)
  end

  test "should get index" do
    get fornecedores_url
    assert_response :success
  end

  test "should get new" do
    get new_fornecedor_url
    assert_response :success
  end

  test "should create fornecedor" do
    assert_difference('Fornecedor.count') do
      post fornecedores_url, params: { fornecedor: { email: @fornecedor.email, nome: @fornecedor.nome, site: @fornecedor.site, telefone: @fornecedor.telefone } }
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
    patch fornecedor_url(@fornecedor), params: { fornecedor: { email: @fornecedor.email, nome: @fornecedor.nome, site: @fornecedor.site, telefone: @fornecedor.telefone } }
    assert_redirected_to fornecedor_url(@fornecedor)
  end

  test "should destroy fornecedor" do
    assert_difference('Fornecedor.count', -1) do
      delete fornecedor_url(@fornecedor)
    end

    assert_redirected_to fornecedores_url
  end
end
