Given("Clicar no botão Novo aluno e acessar a tela de criação de aluno") do
    find(:xpath, "//a[contains(text(),'Novo Aluno')]").click
end

When("Clicar em Acadêmico > Alunos no menu lateral") do
    page.driver.browser.manage.window.resize_to(1920,1080)

    find(:xpath, "//span[contains(text(),'Acadêmico')]").click
    sleep 1
    find(:xpath, "//a[contains(text(),'Alunos')]").click
end

When("Preencher todos os dados necessários para o cadastro de um novo aluno") do

    find(:xpath, "//ng-select[@id='select1']").click
    find(:xpath, "//span[contains(text(),'Brasil')]").click

    # nova_janela = open_new_window

    #     within_window nova_janela do
    #         visit 'https://www.4devs.com.br/gerador_de_cpf'

    #         find(:xpath, "//input[@id='bt_gerar_cpf']").click
    #         find(:xpath, "//span[@class='clipboard-copy']").click
    #     end

    # nova_janela.close

    find(:xpath, "//input[@placeholder='Número']").set(Faker::CPF.numeric)

    find(:xpath, "//input[@placeholder='Nome']").click

    sleep 3
    
    fill_in placeholder: 'Nome', with: 'Aluno de teste ' + Date.today.strftime('%Y%m%d') + Time.now.strftime("%H%M%S")
    
    expect(page.find(:xpath, "//div[@class='toast-info toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Nenhuma pessoa encontrada com o documento informado'

    fill_in placeholder: 'E-mail', with: 'alunoteste' + Date.today.strftime('%Y%m%d') + Time.now.strftime("%H%M%S") + '@gmail.com'
    fill_in placeholder: 'Apelido', with: 'Teste'

    find(:xpath, "//ng-select[div[div[div[contains(text(),'Sexo')]]]]").click
    find(:xpath, "//span[contains(text(),'Masculino')]").click

    fill_in placeholder: 'Selecione...', with: '01/01/2000'

    find(:xpath, "//div[@id='mat-tab-label-0-1']").click
    find(:xpath, "//div[@class='ng-input']//input[@type='text']").click
    find(:xpath, "//span[contains(text(),'Aluno')]").click

    find(:xpath, "//div[contains(text(),'Dados Empresariais')]").click

    find(:xpath, "//i[@class='material-icons icon-remove ng-star-inserted']").click
    expect(page.find(:xpath, "//div[@class='toast-warning toast ng-trigger ng-trigger-flyInOut']")).to have_content 'É Obrigatório ao menos um item'

    find(:xpath, "//div[@class='row']//div[1]//ng-select[1]//div[1]//div[1]//div[2]//input[1]").click
    find(:xpath, "//span[contains(text(),'Fiat')]").click

    find(:xpath, "//ng-select[div[div[div[contains(text(),'Selecione o País')]]]]").click
    find(:xpath, "//ng-dropdown-panel[div[div[div[span[contains(text(),'Brasil')]]]]]").click

    find(:xpath, "//div[3]//ng-select[1]//div[1]//div[1]//div[2]//input[1]").click
    find(:xpath, "//span[contains(text(),'Belo Horizonte')]").click

    find(:xpath, "//div[4]//ng-select[1]//div[1]//div[1]//div[2]//input[1]").click
    find(:xpath, "//span[contains(text(),'ADM / Suporte - Gestor de Pedidos')]").click

    find(:xpath, "//ng-select[div[div[div[contains(text(),'Selecione a Unidade de Negócio')]]]]").click
    find(:xpath, "//span[contains(text(),'Alpinia-Passos')]").click

    find(:xpath, "//div[@id='mat-tab-label-0-3']").click

    fill_in placeholder: 'Nome da Mãe', with: 'mãe dele'
    fill_in placeholder: 'Nome do Pai', with: 'pai dele'

    find(:xpath, "//div[3]//div[1]//div[1]//ng-select[1]//div[1]//div[1]//div[2]//input[1]").click
    find(:xpath, "//span[contains(text(),'Acre')]").click

    find(:xpath, "//ng-select[div[div[div[contains(text(),'Selecione a Cidade')]]]]").click
    find(:xpath, "//span[contains(text(),'Acrelândia')]").click

    fill_in placeholder: 'Peso', with: '80'
    fill_in placeholder: 'Altura', with: '173'

    find(:xpath, "//ng-select[div[div[div[contains(text(),'Tamanho da Camisa')]]]]").click
    find(:xpath, "//span[contains(text(),'3 (M)')]").click

    find(:xpath, "//ng-select[div[div[div[contains(text(),'Selecione...')]]]]").click
    find(:xpath, "//span[contains(text(),'32')]").click

    fill_in placeholder: 'Matrícula', with: '123456'

    sleep 2
end

When("Clicar no botão Salvar") do

    find(:xpath, "//input[@value='Salvar']").click
end

Then("O aluno será cadastrado com sucesso") do

    expect(page.find(:xpath, "//div[@class='toast-success toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Criado com sucesso'

    page.driver.browser.manage.window.resize_to(950,1080)
end