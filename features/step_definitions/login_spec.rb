Given("Acesso o site da Plataforma adaptativa") do
    visit '/'
end

When("Eu digito meu usuário previamente cadastrado") do
    fill_in placeholder: 'E-mail', with: @login
end
  
When("Digito minha senha corretamente") do
    fill_in placeholder: 'Senha', with: @senha
end
  
When("Clico no botão Acessar") do
    click_button 'Acessar'
end

When("Eu digito meu usuário inválido") do
    fill_in placeholder: 'E-mail', with: 'felipez7989@gmail.com.br'
end

When("Digito uma senha inválida") do
    fill_in placeholder: 'Senha', with: '123456teste'
end

When("Clico no botão Esqueceu a senha?") do 
    find(:xpath, "//a[contains(text(),'Esqueceu a senha?')]").click
end

When("Clico no botão Solicitar nova senha") do
    click_button 'Solicitar nova senha'
end
  
Then("Acesso o ambiente da plataforma com sucesso") do
    expect(page).to have_css('.photo-user')
end
    
Then("Recebo uma mensagem informando que o usuário não foi encontrado") do
    expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Usuário não encontrado'
end

Then("Recebo uma mensagem informando o acesso não autorizado") do
    expect(page.find(:xpath, "//div[@class='toast-error toast ng-trigger ng-trigger-flyInOut']")).to have_content 'Acesso não autorizado.'
end

Then("Recebo uma mensagem dizendo que as informações para a troca da senha foram enviadas para meu e-mail") do
    expect(page.find(:xpath, "//div[@id='toast-container']")).to have_content 'O código para troca de senha foi enviado para o e-mail informado.'
end