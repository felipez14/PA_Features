describe 'Help' do 

    before(:each) do
        visit '/'

        @imagem = Dir.pwd + '/spec/fixtures/homer.jpg'

        fill_in placeholder: 'E-mail', with: @login
        fill_in placeholder: 'Senha', with: @senha

        click_button 'Acessar'

        expect(page.find(:xpath, "//h1[@id='titlePage']")) 
    end

    it 'enviando uma mensagem no help', :help do
        find('#buttonHelp').click
        find(:xpath, "//mat-icon[contains(text(),'error')]").click

        find(:xpath, "//input[@id='mat-input-2']").set("Procurando um erro")
        find(:xpath, "//textarea[@id='mat-input-3']").set("Procurando um erro")
        page.driver.browser.all(:xpath, "//input[@id='input-file']").last.send_keys(@imagem)

        find(:xpath, "//span[@class='button button-primary']").click

        expect(page.find(:xpath, "//div[@class='toast-top-right toast-container']")).to have_content 'Sua mensagem foi enviada. Entraremos em contato o mais breve possível.'
    end

    it 'Validando obrigatoriedade dos campos' do
        find('#buttonHelp').click
        find(:xpath, "//mat-icon[contains(text(),'error')]").click

        find(:xpath, "//span[@class='button button-primary']").click

        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Por favor, preencha os campos obrigatórios'
        expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Mínimo de 3 caracteres'
    end
end