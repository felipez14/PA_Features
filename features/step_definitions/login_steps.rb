Given("Acessar o site da Plataforma adaptativa") do
    visit '/'
end

When("Digitar um usuário previamente cadastrado") do
    fill_in placeholder: 'E-mail', with: @login
end
  
When("Digitar a senha corretamente") do
    fill_in placeholder: 'Senha', with: @senha
end
  
When("Clicar no botão Acessar") do
    click_button 'Acessar'
end

When("Digitar um usuário inválido") do
    fill_in placeholder: 'E-mail', with: 'felipez7989@gmail.com.br'
end

When("Digitar uma senha inválida") do
    fill_in placeholder: 'Senha', with: '123456teste'
end

When("Clicar no botão Esqueceu a senha?") do 
    find(:xpath, "//a[contains(text(),'Esqueceu a senha?')]").click
end

When("Clicar no botão Solicitar nova senha") do
    click_button 'Solicitar nova senha'
end
  
Then("Acessar o ambiente da plataforma com sucesso") do
    expect(page).to have_css('.photo-user')
end
    
Then("Deve aparecer uma mensagem informando que o usuário não foi encontrado") do
    expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Usuário não encontrado'
end

Then("Deve aparecer uma mensagem informando a senha inválida") do
    expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Email ou senha inválido'
end

Then("Deve aparecer uma mensagem dizendo que as informações para a troca da senha foram enviadas para o e-mail") do
    expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'O código para troca de senha foi enviado para o e-mail informado.'
end