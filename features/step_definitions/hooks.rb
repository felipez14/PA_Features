Given("Acessar o ambiente da Plataforma adaptativa") do
    visit ''

    fill_in placeholder: 'E-mail', with: @login
    fill_in placeholder: 'Senha', with: @senha

    click_button 'Acessar'
end

After do

    shot_file = page.save_screenshot("report/screenshot/screenshot.png")
    shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
    embed(shot_b64, "image/png", "Screenshot")
end