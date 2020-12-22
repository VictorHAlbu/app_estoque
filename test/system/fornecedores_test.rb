require "application_system_test_case"

class FornecedoresTest < ApplicationSystemTestCase
  setup do
    @fornecedor = fornecedores(:one)
  end

  test "visiting the index" do
    visit fornecedores_url
    assert_selector "h1", text: "Fornecedores"
  end

  test "creating a Fornecedor" do
    visit fornecedores_url
    click_on "New Fornecedor"

    fill_in "Email", with: @fornecedor.email
    fill_in "Nome", with: @fornecedor.nome
    fill_in "Site", with: @fornecedor.site
    fill_in "Telefone", with: @fornecedor.telefone
    click_on "Create Fornecedor"

    assert_text "Fornecedor was successfully created"
    click_on "Back"
  end

  test "updating a Fornecedor" do
    visit fornecedores_url
    click_on "Edit", match: :first

    fill_in "Email", with: @fornecedor.email
    fill_in "Nome", with: @fornecedor.nome
    fill_in "Site", with: @fornecedor.site
    fill_in "Telefone", with: @fornecedor.telefone
    click_on "Update Fornecedor"

    assert_text "Fornecedor was successfully updated"
    click_on "Back"
  end

  test "destroying a Fornecedor" do
    visit fornecedores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fornecedor was successfully destroyed"
  end
end
