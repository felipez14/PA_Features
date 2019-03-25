Given("Acesso o ambiente da Plataforma adaptativa") do
    visit '/'

    fill_in placeholder: 'E-mail', with: @login
    fill_in placeholder: 'Senha', with: @senha

    click_button 'Acessar'
end