describe 'CRUD Aluno' do

    before(:each) do
        page.driver.browser.manage.window.resize_to(1920,1080)

        visit '/'
        
        fill_in placeholder: 'E-mail', with: @login
        fill_in placeholder: 'Senha', with: @senha

        click_button 'Acessar'
    end

    it 'Criando aluno com sucesso (Com credenciais)' do
        
        find(:xpath, "//span[contains(text(),'Acadêmico')]").click
        find(:xpath, "//a[contains(text(),'Alunos')]").click
        find(:xpath, "//a[contains(text(),'Novo Aluno')]").click

        find(:xpath, "//ng-select[@id='select1']").click
        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[1]/div[1]/app-dados-basicos-pessoa[1]/div[1]/div[1]/div[1]/div[1]/div[1]/ng-select[1]/ng-dropdown-panel[1]/div[1]/div[2]/div[1]/span[1]").click

        nova_janela = open_new_window

            within_window nova_janela do
                visit 'https://www.4devs.com.br/gerador_de_cpf'

                find(:xpath, "//input[@id='bt_gerar_cpf']").click
                find(:xpath, "//span[@class='clipboard-copy']").click
            end

        nova_janela.close

        find(:xpath, "//input[@placeholder='Número']").send_keys [:control, 'v']
        
        fill_in placeholder: 'Nome', with: 'Aluno de teste ' + Date.today.strftime('%Y%m%d') + Time.now.strftime("%H%M%S")
        
        expect(page.find(:xpath, "//div[@class='toast-info toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Nenhuma pessoa encontrada com o documento informado'

        fill_in placeholder: 'E-mail', with: 'alunoteste' + Date.today.strftime('%Y%m%d') + Time.now.strftime("%H%M%S") + '@gmail.com'
        fill_in placeholder: 'Apelido', with: 'Teste'

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[1]/div[1]/app-dados-basicos-pessoa[1]/div[1]/div[1]/div[1]/div[6]/div[1]/ng-select[1]/div[1]").click
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

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/div[1]/app-form-list[1]/div[1]/app-dados-empresariais[1]/div[1]/div[1]/div[2]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/div[1]/app-form-list[1]/div[1]/app-dados-empresariais[1]/div[1]/div[1]/div[2]/ng-select[1]/ng-dropdown-panel[1]/div[1]/div[2]/div[1]/span[1]").click

        find(:xpath, "//div[3]//ng-select[1]//div[1]//div[1]//div[2]//input[1]").click
        find(:xpath, "//span[contains(text(),'Belo Horizonte')]").click

        find(:xpath, "//div[4]//ng-select[1]//div[1]//div[1]//div[2]//input[1]").click
        find(:xpath, "//span[contains(text(),'ADM / Suporte - Gestor de Pedidos')]").click

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/div[1]/app-form-list[1]/div[1]/app-dados-empresariais[1]/div[1]/div[1]/div[5]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'Alpinia-Passos')]").click

        find(:xpath, "//div[@id='mat-tab-label-0-3']").click

        fill_in placeholder: 'Nome da Mãe', with: 'mãe dele'
        fill_in placeholder: 'Nome do Pai', with: 'pai dele'

        find(:xpath, "//div[3]//div[1]//div[1]//ng-select[1]//div[1]//div[1]//div[2]//input[1]").click
        find(:xpath, "//span[contains(text(),'Acre')]").click

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[4]/div[1]/app-dados-complementares[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/ng-select[1]/div[1]/div[1]").click
        find(:xpath, "//span[contains(text(),'Acrelândia')]").click

        fill_in placeholder: 'Peso', with: '80'
        fill_in placeholder: 'Altura', with: '173'

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[4]/div[1]/app-dados-complementares[1]/div[1]/div[1]/div[1]/div[5]/div[1]/div[1]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'3 (M)')]").click

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[4]/div[1]/app-dados-complementares[1]/div[1]/div[1]/div[1]/div[5]/div[1]/div[2]/ng-select[1]/div[1]/div[1]/div[2]").click
        find(:xpath, "//span[contains(text(),'32')]").click

        fill_in placeholder: 'Matrícula', with: '123456'

        find(:xpath, "//div[@id='mat-tab-label-0-4']").click
        page.find('i', text: 'add_circle').click

        fill_in placeholder: 'CEP', with: '32670600'

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[5]/div[1]/div[1]/app-form-list[1]/div[1]/app-endereco[1]/div[1]/div[1]/div[1]/div[2]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[5]/div[1]/div[1]/app-form-list[1]/div[1]/app-endereco[1]/div[1]/div[1]/div[1]/div[2]/ng-select[1]/ng-dropdown-panel[1]/div[1]/div[2]/div[1]/span[1]").click

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[5]/div[1]/div[1]/app-form-list[1]/div[1]/app-endereco[1]/div[1]/div[1]/div[1]/div[3]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'Acre')]").click

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[5]/div[1]/div[1]/app-form-list[1]/div[1]/app-endereco[1]/div[1]/div[1]/div[1]/div[4]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'Acrelândia')]").click

        fill_in placeholder: 'Logradouro', with: 'Rua teste'
        fill_in placeholder: 'Número', with: '123'
        fill_in placeholder: 'Complemento', with: 'A'

        find(:xpath, "//div[@id='mat-tab-label-0-5']").click
        page.find('i', text: 'add_circle').click

        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-aluno-register[1]/mat-card[1]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[6]/div[1]/app-form-list[1]/div[1]/app-telefone[1]/div[1]/div[1]/div[1]/div[1]/div[1]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'Celular')]").click

        fill_in placeholder: 'Telefone', with: '31992958977'

        sleep 2

        find(:xpath, "//input[@value='Salvar']").click

        expect(page.find(:xpath, "//div[@class='toast-success toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Criado com sucesso'
    end
end