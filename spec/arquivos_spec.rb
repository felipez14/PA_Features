describe 'Tela de arquivos e visualizador de PDF' do 

    before(:each) do
        visit '/'

        fill_in placeholder: 'E-mail', with: @login
        fill_in placeholder: 'Senha', with: @senha

        click_button 'Acessar'

        expect(page.find(:xpath, "//h1[@id='titlePage']")) 
    end

    it 'Abrindo um arquivo' do

        visit '/files'

        find(:xpath, "//div[@class='ng-input']//input[@type='text']").click
        find(:xpath, "//span[@class='ng-option-label ng-star-inserted']").click
        find(:xpath, "//a[@class='button button-primary']").click
        expect(page).to have_content('Manual Técnico')

        find(:xpath, "//div[@class='row']//div[1]//mat-card[1]").click

        expect(find(:xpath, "//div[@class='textLayer']").visible?).to be true
    end
end