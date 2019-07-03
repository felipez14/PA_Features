describe 'CRUD Aluno' do

    before(:each) do

        visit '/'
        
        fill_in placeholder: 'E-mail', with: @login
        fill_in placeholder: 'Senha', with: @senha

        click_button 'Acessar'

        expect(page.find(:xpath, "//h1[@id='titlePage']"))        
    end

    it 'Criando aluno com sucesso (Com credenciais)' do
        
        visit '/academic/student/0'

        find(:xpath, "//ng-select[@id='select1']").click
        find('span', text: 'Brasil').click

        # Implementação open new window

        # nova_janela = open_new_window

        #     within_window nova_janela do
        #         visit 'https://www.4devs.com.br/gerador_de_cpf'

        #         find(:xpath, "//input[@id='bt_gerar_cpf']").click
        #         find(:xpath, "//span[@class='clipboard-copy']").click
        #     end

        # nova_janela.close

        find(:xpath, "//input[@placeholder='Número']").set(Faker::CPF.numeric)
        find(:xpath, "//i[@class='material-icons icon-find ng-star-inserted']").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Nenhuma pessoa encontrada com o documento informado'
        
        fill_in placeholder: 'Nome', with: Faker::Name.name
        fill_in placeholder: 'E-mail', with: Faker::Internet.email
        fill_in placeholder: 'Apelido', with: Faker::Name.name

        find(:xpath, "//div[@class='ng-select-container']//div[@class='ng-input']").click
        find(:xpath, "//span[contains(text(),'Masculino')]").click

        fill_in placeholder: 'Selecione...', with: '01/01/2000'

        find(:xpath, "//div[@id='mat-tab-label-0-1']").click
        find(:xpath, "//div[@class='ng-input']//input[@type='text']").click
        find(:xpath, "//span[contains(text(),'Aluno')]").click

        find(:xpath, "//div[contains(text(),'Dados Empresariais')]").click

        find(:xpath, "//i[@class='material-icons icon-remove ng-star-inserted']").click
        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'É Obrigatório ao menos um item'

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/div[1]/app-form-list[1]/div[1]/app-dados-empresariais[1]/div[1]/div[1]/div[1]/ng-select[1]/div[1]/div[1]/div[2]").click
        find('span', text: 'Fiat').click

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/div[1]/app-form-list[1]/div[1]/app-dados-empresariais[1]/div[1]/div[1]/div[2]/ng-select[1]/div[1]/div[1]/div[2]").click
        find('span', text: 'Brasil').click

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/div[1]/app-form-list[1]/div[1]/app-dados-empresariais[1]/div[1]/div[1]/div[3]/ng-select[1]/div[1]/div[1]/div[2]").click
        find('span', text: 'Belo Horizonte').click

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/div[1]/app-form-list[1]/div[1]/app-dados-empresariais[1]/div[1]/div[1]/div[4]/ng-select[1]/div[1]/div[1]/div[2]").click
        find('span', text: 'ADM / Suporte - Gestor de Pedidos').click

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/div[1]/app-form-list[1]/div[1]/app-dados-empresariais[1]/div[1]/div[1]/div[5]/ng-select[1]/div[1]/div[1]/div[2]").click
        find('span', text: 'Alpinia-Passos').click

        find(:xpath, "//input[@value='Salvar']").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Criado com sucesso'
    end
end