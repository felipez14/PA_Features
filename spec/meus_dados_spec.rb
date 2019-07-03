describe 'Tela de Meus dados' do
    before(:each) do
        visit '/'

        @imagem = Dir.pwd + '/spec/fixtures/flowers.png'

        fill_in placeholder: 'E-mail', with: @login
        fill_in placeholder: 'Senha', with: @senha

        click_button 'Acessar'
    end

    it 'Preenchendo todos os dados', :todosdados do

        find(:xpath, "//div[@class='icons-bar ng-tns-c5-0']//div[@class='photo-user']").click
        find(:xpath, "//mat-icon[contains(text(),'account_box')]").click

        fill_in placeholder: 'Apelido', with: 'Felipe teste'

        find(:xpath, "//div[contains(text(),'Acessos')]").click
        find(:xpath, "//div[contains(text(),'Dados complementares')]").click

        fill_in placeholder: 'Nome da Mãe', with: 'mãe dele'
        fill_in placeholder: 'Nome do Pai', with: 'pai dele'

        #ESTADO
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-meus-dados[1]/mat-card[1]/div[1]/div[2]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/app-dados-complementares[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/ng-select[1]/div[1]").click
        find(:xpath, "//span[contains(text(),'Minas Gerais')]").click
        #ESTADO

        #NATURALIDADE
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-meus-dados[1]/mat-card[1]/div[1]/div[2]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/app-dados-complementares[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'Abadia dos Dourados')]").click
        #NATURALIDADE

        fill_in placeholder: 'Peso', with: '80'
        fill_in placeholder: 'Altura', with: '173'

        #TAMANHO DA CAMISA
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-meus-dados[1]/mat-card[1]/div[1]/div[2]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/app-dados-complementares[1]/div[1]/div[1]/div[1]/div[5]/div[1]/div[1]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'3 (M)')]").click
        #TAMANHO DA CAMISA

        #TAMANHO DO CALÇADO
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-meus-dados[1]/mat-card[1]/div[1]/div[2]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[3]/div[1]/app-dados-complementares[1]/div[1]/div[1]/div[1]/div[5]/div[1]/div[2]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'41')]").click
        #TAMANHO DO CALÇADO

        fill_in placeholder: 'Matrícula', with: '123456'

        find(:xpath, "//div[contains(text(),'Endereços')]").click
        page.find('i', text: 'add_circle').click

        fill_in placeholder: 'CEP', with: '32670600'

        #PAIS
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-meus-dados[1]/mat-card[1]/div[1]/div[2]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[4]/div[1]/div[1]/app-form-list[1]/div[1]/app-endereco[1]/div[1]/div[1]/div[1]/div[2]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'Brasil')]").click
        #PAIS

        #ESTADO
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-meus-dados[1]/mat-card[1]/div[1]/div[2]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[4]/div[1]/div[1]/app-form-list[1]/div[1]/app-endereco[1]/div[1]/div[1]/div[1]/div[3]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'Minas Gerais')]").click
        #ESTADO

        #CIDADE
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-meus-dados[1]/mat-card[1]/div[1]/div[2]/form[1]/div[1]/mat-tab-group[1]/div[1]/mat-tab-body[4]/div[1]/div[1]/app-form-list[1]/div[1]/app-endereco[1]/div[1]/div[1]/div[1]/div[4]/ng-select[1]/div[1]/div[1]/div[2]/input[1]").click
        find(:xpath, "//span[contains(text(),'Betim')]").click
        #CIDADE

        fill_in placeholder: 'Logradouro', with: 'Rua teste'
        fill_in placeholder: 'Número', with: '123'
        fill_in placeholder: 'Complemento', with: 'A'

        find(:xpath, "//div[contains(text(),'Telefones')]").click
        find(:xpath, "//i[@class='material-icons icon-remove']").click

        find('ng-select[formcontrolname=tipoTelefone]').click
        find(:xpath, "//span[contains(text(),'Celular')]").click

        fill_in placeholder: 'Telefone', with: '31992958977'

        find(:xpath, "//input[@value='Salvar']").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Dados salvos com sucesso'
    end

    it 'Removendo todos os dados', :removendo do

        find(:xpath, "//div[@class='icons-bar ng-tns-c5-0']//div[@class='photo-user']").click
        find(:xpath, "//mat-icon[contains(text(),'account_box')]").click

        apelido = find(:xpath, "//input[@placeholder='Apelido']")
        apelido.native.clear

        find(:xpath, "//div[contains(text(),'Acessos')]").click

        find(:xpath, "//div[contains(text(),'Dados complementares')]").click

        fill_in placeholder: 'Nome da Mãe', with: ''
        fill_in placeholder: 'Nome do Pai', with: ''

        #ESTADO
        find(:xpath, "//div[@class='col-md-6']//div[3]//div[1]//div[1]//ng-select[1]//div[1]//span[1]//span[1]").click
        #ESTADO

        #NATURALIDADE
        find(:xpath, "//div[@class='col-md-6']//div[3]//div[1]//div[2]//ng-select[1]//div[1]//span[1]//span[1]").click
        #NATURALIDADE

        fill_in placeholder: 'Peso', with: ''
        fill_in placeholder: 'Altura', with: ''

        #TAMANHO DA CAMISA
        find(:xpath, "//div[@class='col-md-6']//div[5]//div[1]//div[1]//ng-select[1]//div[1]//span[1]//span[1]").click
        #TAMANHO DA CAMISA

        #TAMANHO DO CALÇADO
        find(:xpath, "//ng-select[@name='tamanhoCalcado']//span[@class='ng-clear'][contains(text(),'×')]").click
        #TAMANHO DO CALÇADO

        fill_in placeholder: 'Matrícula', with: ''

        find(:xpath, "//div[contains(text(),'Endereços')]").click

        find(:xpath, "//i[@class='material-icons icon-remove'][contains(text(),'close')]").click

        find(:xpath, "//div[contains(text(),'Telefones')]").click

        find(:xpath, "//i[@class='material-icons icon-remove'][contains(text(),'close')]").click
        
        sleep 3

        find(:xpath, "//input[@value='Salvar']").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Dados salvos com sucesso'
    end

    it 'Troca de senha' do
        
        find(:xpath, "//div[@class='icons-bar ng-tns-c5-0']//div[@class='photo-user']").click
        find(:xpath, "//a[contains(text(),'Alterar Senha')]").click

        fill_in placeholder: 'Senha Atual', with: '123456'
        fill_in placeholder: 'Nova Senha', with: '123456'
        fill_in placeholder: 'Confirmação de senha', with: '123456'

        find(:xpath, "//button[@type='submit']").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Senha alterada com sucesso'        
    end

    it 'Troca de senha com senha atual inválida', :senhaatualinvalida do

        find(:xpath, "//div[@class='icons-bar ng-tns-c5-0']//div[@class='photo-user']").click
        find(:xpath, "//a[contains(text(),'Alterar Senha')]").click

        fill_in placeholder: 'Senha Atual', with: 'testes'
        fill_in placeholder: 'Nova Senha', with: '123456'
        fill_in placeholder: 'Confirmação de senha', with: '123456'

        find(:xpath, "//button[@type='submit']").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Senha inválida'     
    end

    it 'Troca de senha com senhas diferentes', :senhadiferente do

        find(:xpath, "//div[@class='icons-bar ng-tns-c5-0']//div[@class='photo-user']").click
        find(:xpath, "//a[contains(text(),'Alterar Senha')]").click

        fill_in placeholder: 'Senha Atual', with: '123456'
        fill_in placeholder: 'Nova Senha', with: '123456'
        fill_in placeholder: 'Confirmação de senha', with: '123456teste'

        expect(page.find(:xpath, "//small[@class='mat-text-warn ng-star-inserted']")).to have_content 'Senhas diferentes.'
    end

    it 'Validação de senha com no minimo 6 caracteres', :minimocaracteres do

        find(:xpath, "//div[@class='icons-bar ng-tns-c5-0']//div[@class='photo-user']").click
        find(:xpath, "//a[contains(text(),'Alterar Senha')]").click

        fill_in placeholder: 'Senha Atual', with: '123'
        fill_in placeholder: 'Nova Senha', with: '123'
        fill_in placeholder: 'Confirmação de senha', with: '123'
        
        expect(page.find(:xpath, "//div[@class='form']//div[1]//small[1]")).to have_content 'Mínimo 6 caracteres'
        expect(page.find(:xpath, "//div[@class='form']//div[2]//small[1]")).to have_content 'Mínimo 6 caracteres'
    end
end