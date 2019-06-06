Feature: Login da PA
  Tela de login da Plataforma Adaptativa

  Background: 
    Given Acessar o site da Plataforma adaptativa

  Scenario: Realizando login na PA com sucesso
    When Digitar um usuário previamente cadastrado
    And Digitar a senha corretamente
    And Clicar no botão Acessar
    Then Acessar o ambiente da plataforma com sucesso

  Scenario: Tentativa de login com e-mail inválido
    When Digitar um usuário inválido
    And Digitar a senha corretamente
    And Clicar no botão Acessar
    Then Deve aparecer uma mensagem informando que o usuário não foi encontrado

  Scenario: Tentativa de login com senha inválida
    When Digitar um usuário previamente cadastrado
    And Digitar uma senha inválida
    And Clicar no botão Acessar
    Then Deve aparecer uma mensagem informando a senha inválida

  Scenario: Esqueci minha senha
    When Clicar no botão Esqueceu a senha?
    And Digitar um usuário previamente cadastrado
    And Clicar no botão Solicitar nova senha
    Then Deve aparecer uma mensagem dizendo que as informações para a troca da senha foram enviadas para o e-mail

  Scenario: Tentativa de recuperar a senha com um e-mail não cadastrado
    When Clicar no botão Esqueceu a senha?
    And Digitar um usuário inválido
    And Clicar no botão Solicitar nova senha
    Then Deve aparecer uma mensagem informando que o usuário não foi encontrado