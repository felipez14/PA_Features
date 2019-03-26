When("Clico em Perfis no menu lateral") do

    find(:xpath, "//mat-icon[contains(text(),'menu')]").click
    find(:xpath, "//span[contains(text(),'Administração')]").click
    find(:xpath, "//a[contains(text(),'Perfil')]").click
end

When("Clico no botão Novo perfil") do

    find(:xpath, "//a[contains(text(),'Novo Perfil')]").click
end

Then("Preencho os campos Nome e Descrição") do

    fill_in placeholder: 'Nome', with: 'Perfil de testes ' + Date.today.strftime('%Y-%m-%d') + Time.now.strftime("%H:%M:%S")
    fill_in placeholder: 'Descrição', with: 'Perfil de testes ' + Date.today.strftime('%Y-%m-%d') + Time.now.strftime("%H:%M:%S")
end

When("Seleciono as permissões desejadas para atribuir ao perfil") do

    find(:css, "#mat-checkbox-5").click
    find(:css, "#mat-checkbox-6").click
end

When("Clico em Salvar") do

    click_button 'Salvar'
end

Then("Recebo uma notificação dizendo que o perfil foi salvo com sucesso") do

    expect(page.find(:xpath, "//div[@class='toast-top-right toast-container']")).to have_content 'Salvo com sucesso'
end

Then("Preencho o campo Nome com o nome de outro perfil já cadastrado") do

    fill_in placeholder: 'Nome', with: 'Aluno'
    fill_in placeholder: 'Descrição', with: 'Aluno'
end

Then("Recebo uma notificação dizendo que já existe um perfil cadastrado com o nome informado") do

    expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content "Já existe um perfil cadastrado com o 'Nome' informado"
end

When("Não seleciono qualquer permissão") do

end

Then("Recebo uma notificação dizendo que devo selecionar pelo menos uma permissão") do
    
    expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Favor preencher os campos obrigatórios'
    expect(page.find(:xpath, "//p[@class='ui-messages-error ng-star-inserted']")).to have_content 'Selecione pelo menos 1 permissão'
end