require "application_system_test_case"

class ProdutosTest < ApplicationSystemTestCase
  setup do
    @produto = produtos(:one)
  end

  test "visiting the index" do
    visit produtos_url
    assert_selector "h1", text: "Produtos"
  end

  test "creating a Produto" do
    visit produtos_url
    click_on "New Produto"

    fill_in "Descricao", with: @produto.descricao
    fill_in "Nome", with: @produto.nome
    fill_in "Preco compra", with: @produto.preco_compra
    fill_in "Preco venda", with: @produto.preco_venda
    fill_in "Quantidade", with: @produto.quantidade
    fill_in "Vecimento", with: @produto.vecimento
    click_on "Create Produto"

    assert_text "Produto was successfully created"
    click_on "Back"
  end

  test "updating a Produto" do
    visit produtos_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @produto.descricao
    fill_in "Nome", with: @produto.nome
    fill_in "Preco compra", with: @produto.preco_compra
    fill_in "Preco venda", with: @produto.preco_venda
    fill_in "Quantidade", with: @produto.quantidade
    fill_in "Vecimento", with: @produto.vecimento
    click_on "Update Produto"

    assert_text "Produto was successfully updated"
    click_on "Back"
  end

  test "destroying a Produto" do
    visit produtos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Produto was successfully destroyed"
  end
end
