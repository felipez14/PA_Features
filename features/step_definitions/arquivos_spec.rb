When("Clico em Arquivos no menu lateral") do

    find(:xpath, "//mat-icon[contains(text(),'menu')]").click
    find(:xpath, "//span[contains(text(),'Arquivos')]").click
end

Then("Vejo na minha tela todos os arquivos disponiveis na Plataforma adaptativa") do

    expect(page).to have_content('Manual Técnico')
end

When("Eu seleciono o arquivo que desejo") do

    find(:xpath, "//div[@class='ng-input']//input[@type='text']").click
    find(:xpath, "//span[@class='ng-option-label ng-star-inserted']").click
    find(:xpath, "//a[@class='button button-primary']").click

    find(:xpath, "//div[@class='row']//div[1]//mat-card[1]").click
    sleep 60
end

Then("Sou direcionado para a tela de Visualizador de PDF onde poderei navegar pelo arquivo selecionado") do
    expect(find(:xpath, "//div[@class='textLayer']").visible?).to be true
end