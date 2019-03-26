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

When("Marco o checkbox Padrão") do

    find(:xpath, "//span[contains(text(),'Padrão')]").click
end

Then("Recebo uma notificação dizendo que já existe um perfil cadastrado com padrão") do
    
    expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Já existe um perfil cadastrado como padrão'
end

When("Clico em editar o perfil que desejo inativar") do

    find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-profile-list[1]/lda-table[1]/mat-card[1]/div[1]/mat-table[1]/mat-row[4]/mat-cell[4]/a[1]/mat-icon[1]").click
end

Then("Clico em Inativar perfil") do 

    find(:xpath, "//button[@class='button-excluir button button-primary ng-star-inserted']").click
end

When("Clico em OK na janela que abriu para confirmar a inativação") do

    find(:xpath, "//button[contains(text(),'OK')]").click
end

Then("Recebo uma notificação dizendo que o perfil foi inativado com sucesso") do

    expect(page.find(:xpath, "//div[@class='toast-top-right toast-container']")).to have_content 'Inativado com sucesso'
end
  
When("Clico em editar o perfil associado que desejo inativar") do

    find(:xpath, "//a[@href='/auth/profiles/1']//mat-icon[@class='mat-icon material-icons'][contains(text(),'edit')]").click
end

Then("Recebo uma notificação dizendo que não é possível inativar um perfil que tenha um usuário ativo já associado") do

    expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Não é possível desativar um perfil que tenha um usuário ativo já associado'
end