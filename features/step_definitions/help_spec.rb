When("Clico no botão flutuante da funcionalidade localizado no canto inferior direito") do

    find('#buttonHelp').click
end

When("Seleciono uma das opções - Dúvida, sugestão, elogio ou erro") do

    find(:xpath, "//mat-icon[contains(text(),'error')]").click
end
  
Then("Preencho os campos de Assunto e Mensagem") do

    find(:xpath, "//input[@id='mat-input-2']").set("Teste")
    find(:xpath, "//textarea[@id='mat-input-3']").set("Teste")
end

When("Opcionalmente, anexo uma imagem") do

    @imagem = Dir.pwd + '/spec/fixtures/logo.jpg'
    page.driver.browser.all(:xpath, "//input[@id='input-file']").last.send_keys(@imagem)
end

When("Clico no botão Enviar") do

    find(:xpath, "//span[@class='button button-primary']").click
end

Then("Recebo uma notificação dizendo que minha mensagem foi enviada") do

    expect(page.find(:xpath, "//div[@class='toast-top-right toast-container']")).to have_content 'Sua mensagem foi enviada. Entraremos em contato o mais breve possível.'
end

Then("Não preencho os campos de Assunto e Mensagem") do

end

Then("Recebo uma notificação dizendo que preciso preencher os campos obrigatórios") do

    expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Por favor, preencha os campos obrigatórios'
    expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'Mínimo de 3 caracteres'
end