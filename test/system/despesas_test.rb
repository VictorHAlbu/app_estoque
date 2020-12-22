require "application_system_test_case"

class DespesasTest < ApplicationSystemTestCase
  setup do
    @despesa = despesas(:one)
  end

  test "visiting the index" do
    visit despesas_url
    assert_selector "h1", text: "Despesas"
  end

  test "creating a Despesa" do
    visit despesas_url
    click_on "New Despesa"

    fill_in "Descricao", with: @despesa.descricao
    fill_in "Nome", with: @despesa.nome
    fill_in "Valor", with: @despesa.valor
    click_on "Create Despesa"

    assert_text "Despesa was successfully created"
    click_on "Back"
  end

  test "updating a Despesa" do
    visit despesas_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @despesa.descricao
    fill_in "Nome", with: @despesa.nome
    fill_in "Valor", with: @despesa.valor
    click_on "Update Despesa"

    assert_text "Despesa was successfully updated"
    click_on "Back"
  end

  test "destroying a Despesa" do
    visit despesas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Despesa was successfully destroyed"
  end
end
