Feature: Login da PA
  Tela de login da Plataforma Adaptativa

  Background: 
    Given Acesso o site da Plataforma adaptativa

  Scenario: Realizando login na PA com sucesso
    When Eu digito meu usuário previamente cadastrado
    And Digito minha senha corretamente
    And Clico no botão Acessar
    Then Acesso o ambiente da plataforma com sucesso

  Scenario: Tentativa de login com e-mail inválido
    When Eu digito meu usuário inválido
    And Digito minha senha corretamente
    And Clico no botão Acessar
    Then Recebo uma mensagem informando que o usuário não foi encontrado

  Scenario: Tentativa de login com senha inválida
    When Eu digito meu usuário previamente cadastrado
    And Digito uma senha inválida
    And Clico no botão Acessar
    Then Recebo uma mensagem informando o acesso não autorizado

  Scenario: Esqueci minha senha
    When Clico no botão Esqueceu a senha?
    And Eu digito meu usuário previamente cadastrado
    And Clico no botão Solicitar nova senha
    Then Recebo uma mensagem dizendo que as informações para a troca da senha foram enviadas para meu e-mail

  Scenario: Tentativa de recuperar a senha com um e-mail não cadastrado
    When Clico no botão Esqueceu a senha?
    And Eu digito meu usuário inválido
    And Clico no botão Solicitar nova senha
    Then Recebo uma mensagem informando que o usuário não foi encontrado