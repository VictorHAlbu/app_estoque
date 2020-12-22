require "application_system_test_case"

class PedidoProdutosTest < ApplicationSystemTestCase
  setup do
    @pedido_produto = pedido_produtos(:one)
  end

  test "visiting the index" do
    visit pedido_produtos_url
    assert_selector "h1", text: "Pedido Produtos"
  end

  test "creating a Pedido produto" do
    visit pedido_produtos_url
    click_on "New Pedido Produto"

    fill_in "Pedido", with: @pedido_produto.pedido_id
    fill_in "Produto", with: @pedido_produto.produto_id
    fill_in "Valor", with: @pedido_produto.valor
    click_on "Create Pedido produto"

    assert_text "Pedido produto was successfully created"
    click_on "Back"
  end

  test "updating a Pedido produto" do
    visit pedido_produtos_url
    click_on "Edit", match: :first

    fill_in "Pedido", with: @pedido_produto.pedido_id
    fill_in "Produto", with: @pedido_produto.produto_id
    fill_in "Valor", with: @pedido_produto.valor
    click_on "Update Pedido produto"

    assert_text "Pedido produto was successfully updated"
    click_on "Back"
  end

  test "destroying a Pedido produto" do
    visit pedido_produtos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pedido produto was successfully destroyed"
  end
end
