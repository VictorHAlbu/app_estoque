require "application_system_test_case"

class ReceitasTest < ApplicationSystemTestCase
  setup do
    @receita = receitas(:one)
  end

  test "visiting the index" do
    visit receitas_url
    assert_selector "h1", text: "Receitas"
  end

  test "creating a Receita" do
    visit receitas_url
    click_on "New Receita"

    fill_in "Descricao", with: @receita.descricao
    fill_in "Despesas", with: @receita.despesas
    fill_in "Nome", with: @receita.nome
    fill_in "Valor", with: @receita.valor
    click_on "Create Receita"

    assert_text "Receita was successfully created"
    click_on "Back"
  end

  test "updating a Receita" do
    visit receitas_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @receita.descricao
    fill_in "Despesas", with: @receita.despesas
    fill_in "Nome", with: @receita.nome
    fill_in "Valor", with: @receita.valor
    click_on "Update Receita"

    assert_text "Receita was successfully updated"
    click_on "Back"
  end

  test "destroying a Receita" do
    visit receitas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receita was successfully destroyed"
  end
end
