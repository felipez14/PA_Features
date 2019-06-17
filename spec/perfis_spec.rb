describe 'Administração > Perfil' do
    before(:each) do
        visit '/'
        
        fill_in placeholder: 'E-mail', with: @login
        fill_in placeholder: 'Senha', with: @senha

        click_button 'Acessar'
    end

    it 'Criando um Perfil com sucesso' do 
        find(:xpath, "//mat-icon[contains(text(),'menu')]").click
        find(:xpath, "//span[contains(text(),'Administração')]").click
        find(:xpath, "//a[contains(text(),'Perfil')]").click
        find(:xpath, "//a[contains(text(),'Novo Perfil')]").click

        fill_in placeholder: 'Nome', with: 'Perfil de testes ' + Date.today.strftime('%Y-%m-%d') + Time.now.strftime("%H:%M:%S")
        fill_in placeholder: 'Descrição', with: 'Perfil de testes ' + Date.today.strftime('%Y-%m-%d') + Time.now.strftime("%H:%M:%S")

        find(:css, "#mat-checkbox-5").click
        find(:css, "#mat-checkbox-6").click

        click_button 'Salvar'

        find(:xpath, "//i[contains(text(),'filter_list')]").click
        fill_in placeholder: 'Nome', with: 'Perfil de testes'
        find(:xpath, "//a[contains(text(),'Filtrar')]").click

        expect(page.find(:xpath, "//mat-cell[@class='mat-cell cdk-column-nome mat-column-nome ng-star-inserted']")).to have_content 'Perfil de testes'
    end

    it 'Tentando criar um Perfil com nome já existente' do

        find(:xpath, "//mat-icon[contains(text(),'menu')]").click
        find(:xpath, "//span[contains(text(),'Administração')]").click
        find(:xpath, "//a[contains(text(),'Perfil')]").click
        find(:xpath, "//a[contains(text(),'Novo Perfil')]").click

        fill_in placeholder: 'Nome', with: 'Aluno'
        fill_in placeholder: 'Descrição', with: 'Aluno'

        find(:css, "#mat-checkbox-5").click
        find(:css, "#mat-checkbox-6").click

        click_button 'Salvar'

        expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content "Já existe um perfil cadastrado com o 'Nome' informado"
    end

    it 'Tentando criar um Perfil sem permissões' do

        find(:xpath, "//mat-icon[contains(text(),'menu')]").click
        find(:xpath, "//span[contains(text(),'Administração')]").click
        find(:xpath, "//a[contains(text(),'Perfil')]").click
        find(:xpath, "//a[contains(text(),'Novo Perfil')]").click

        fill_in placeholder: 'Nome', with: 'Perfil de testes sem permissão ' + Date.today.strftime('%Y-%m-%d') + Time.now.strftime("%H:%M:%S")
        fill_in placeholder: 'Descrição', with: 'Perfil de testes sem permissão ' + Date.today.strftime('%Y-%m-%d') + Time.now.strftime("%H:%M:%S")

        click_button 'Salvar'

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Favor preencher os campos obrigatórios'
        expect(page.find(:xpath, "//p[@class='ui-messages-error ng-star-inserted']")).to have_content 'Selecione pelo menos 1 permissão'
    end

    it 'Tentando criar um Perfil padrão, sendo que, já existe um perfil padrão', :checkbox do 

        find(:xpath, "//mat-icon[contains(text(),'menu')]").click
        find(:xpath, "//span[contains(text(),'Administração')]").click
        find(:xpath, "//a[contains(text(),'Perfil')]").click
        find(:xpath, "//a[contains(text(),'Novo Perfil')]").click

        fill_in placeholder: 'Nome', with: 'Perfil de testes padrão ' + Date.today.strftime('%Y-%m-%d') + Time.now.strftime("%H:%M:%S")
        fill_in placeholder: 'Descrição', with: 'Perfil de testes padrão ' + Date.today.strftime('%Y-%m-%d') + Time.now.strftime("%H:%M:%S")

        sleep 10

        find(:css, "#mat-checkbox-5").click
        find(:css, "#mat-checkbox-6").click

        find(:xpath, "//span[contains(text(),'Padrão')]").click

        click_button 'Salvar'

        expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Já existe um perfil cadastrado como padrão'
    end

    it 'Inativando um perfil', :inativandoperfil do

        find(:xpath, "//mat-icon[contains(text(),'menu')]").click
        find(:xpath, "//span[contains(text(),'Administração')]").click
        find(:xpath, "//a[contains(text(),'Perfil')]").click
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-profile-list[1]/lda-table[1]/mat-card[1]/div[1]/mat-table[1]/mat-row[3]/mat-cell[4]/a[1]/mat-icon[1]").click

        find(:xpath, "//button[@class='button-excluir button button-primary ng-star-inserted']").click
        find(:xpath, "//button[contains(text(),'OK')]").click

        expect(page.find(:xpath, "//div[@class='toast-top-right toast-container']")).to have_content 'Inativado com sucesso'
    end

    it 'Inativando um perfil associado a um usuário', :associado do

        find(:xpath, "//mat-icon[contains(text(),'menu')]").click
        find(:xpath, "//span[contains(text(),'Administração')]").click
        find(:xpath, "//a[contains(text(),'Perfil')]").click
        find(:xpath, "/html[1]/body[1]/app-root[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-profile-list[1]/lda-table[1]/mat-card[1]/div[1]/mat-table[1]/mat-row[1]/mat-cell[4]/a[1]/mat-icon[1]").click

        find(:xpath, "//button[@class='button-excluir button button-primary ng-star-inserted']").click
        find(:xpath, "//button[contains(text(),'OK')]").click

        expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Não é possível desativar um perfil que tenha um usuário ativo já associado'
    end
end