describe 'Administração > Perfil' do
    before(:each) do
        visit '/'
        
        fill_in placeholder: 'E-mail', with: @login
        fill_in placeholder: 'Senha', with: @senha

        click_button 'Acessar'

        expect(page.find(:xpath, "//h1[@id='titlePage']"))
    end

    it 'Criando um Perfil com sucesso' do 
        
        visit '/management/profiles/0'

        fill_in placeholder: 'Nome', with: Faker::Name.name
        fill_in placeholder: 'Descrição', with: Faker::Lorem.paragraph(2)

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-profile-register[1]/mat-card[1]/form[1]/div[1]/div[3]/mat-tab-group[1]/div[1]/mat-tab-body[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/mat-checkbox[1]").click        

        click_button 'Salvar'

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Salvo com sucesso'
    end

    it 'Tentando criar um Perfil com nome já existente' do

        visit '/management/profiles/0'

        fill_in placeholder: 'Nome', with: 'Aluno'
        fill_in placeholder: 'Descrição', with: 'Aluno'

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-profile-register[1]/mat-card[1]/form[1]/div[1]/div[3]/mat-tab-group[1]/div[1]/mat-tab-body[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/mat-checkbox[1]").click        

        click_button 'Salvar'

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content "Já existe um perfil cadastrado com o 'Nome' informado"
    end

    it 'Tentando criar um Perfil sem permissões' do

        visit '/management/profiles/0'

        fill_in placeholder: 'Nome', with: Faker::Name.name
        fill_in placeholder: 'Descrição', with: Faker::Lorem.paragraph(2)

        click_button 'Salvar'

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Favor preencher os campos obrigatórios'
        expect(page.find(:xpath, "//p[@class='ui-messages-error ng-star-inserted']")).to have_content 'Selecione pelo menos 1 permissão'
    end

    it 'Tentando criar um Perfil padrão, sendo que, já existe um perfil padrão', :checkbox do 

        visit '/management/profiles/0'

        fill_in placeholder: 'Nome', with: Faker::Name.name
        fill_in placeholder: 'Descrição', with: Faker::Lorem.paragraph(2)

        find(:xpath, "/html[1]/body[1]/app-root[1]/div[1]/app-layout[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-profile-register[1]/mat-card[1]/form[1]/div[1]/div[3]/mat-tab-group[1]/div[1]/mat-tab-body[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/mat-checkbox[1]").click        

        find(:xpath, "//span[contains(text(),'Padrão')]").click

        click_button 'Salvar'

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Já existe um perfil cadastrado como padrão'
    end

    it 'Inativando um perfil', :inativandoperfil do

        visit '/management/profiles'

        find(:xpath, "//mat-row[4]//mat-cell[4]//a[1]").click

        find(:xpath, "//button[@class='button-excluir button button-primary ng-star-inserted']").click
        find(:xpath, "//button[contains(text(),'OK')]").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Inativado com sucesso'
    end

    it 'Tentando inativar um perfil associado a um usuário', :associado do

        visit '/management/profiles/1'

        find(:xpath, "//button[@class='button-excluir button button-primary ng-star-inserted']").click
        find(:xpath, "//button[contains(text(),'OK')]").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Não é possível desativar um perfil que tenha um usuário ativo já associado'
    end
end