require 'test_helper'

class PedidoProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido_produto = pedido_produtos(:one)
  end

  test "should get index" do
    get pedido_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_pedido_produto_url
    assert_response :success
  end

  test "should create pedido_produto" do
    assert_difference('PedidoProduto.count') do
      post pedido_produtos_url, params: { pedido_produto: { pedido_id: @pedido_produto.pedido_id, produto_id: @pedido_produto.produto_id, valor: @pedido_produto.valor } }
    end

    assert_redirected_to pedido_produto_url(PedidoProduto.last)
  end

  test "should show pedido_produto" do
    get pedido_produto_url(@pedido_produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_pedido_produto_url(@pedido_produto)
    assert_response :success
  end

  test "should update pedido_produto" do
    patch pedido_produto_url(@pedido_produto), params: { pedido_produto: { pedido_id: @pedido_produto.pedido_id, produto_id: @pedido_produto.produto_id, valor: @pedido_produto.valor } }
    assert_redirected_to pedido_produto_url(@pedido_produto)
  end

  test "should destroy pedido_produto" do
    assert_difference('PedidoProduto.count', -1) do
      delete pedido_produto_url(@pedido_produto)
    end

    assert_redirected_to pedido_produtos_url
  end
end
