When("Pesquiso sobre um manual técnico") do
    fill_in placeholder: 'Pesquise cursos, manuais, arquivos...', with: 'Manual técnico'

    find(:xpath, "//mat-icon[contains(text(),'search')]").click
    sleep 1
    find(:xpath, "//a[contains(text(),'Arquivos')]").click
end 

When("Pesquiso sobre um curso") do
    fill_in placeholder: 'Pesquise cursos, manuais, arquivos...', with: 'Curso'

    find(:xpath, "//mat-icon[contains(text(),'search')]").click
    sleep 1
    find(:xpath, "//ul[@class='list-unstyled search-filters']//a[contains(text(),'Cursos')]").click
end

When("Faço uma pesquisa qualquer através do campo presente na tela de inicio") do 

    find(:xpath, "//div[@class='conteudo']//input[@type='text']").set("Cursos")
    find(:xpath, "//i[@class='material-icons'][contains(text(),'search')]").click
end

Then("Recebo os resultados do manual pesquisado") do
    expect(page).not_to have_selector(:xpath, "//div[@class='no-result ng-star-inserted']")
end

Then("Recebo os resultados do curso pesquisado") do
    expect(page).not_to have_selector(:xpath, "//div[@class='no-result ng-star-inserted']")
end

Then("Sou redirecionado para a tela de resultados contendo os dados da pesquisa feita") do
    expect(page.find(:xpath, "//h4[contains(text(),'Resultados')]"))
end