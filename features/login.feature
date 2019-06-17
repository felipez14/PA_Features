Feature: Login da PA
  Tela de login da Plataforma Adaptativa

  Scenario: Optar por permanecer logado na aplicação
    When digitar um e-mail e senha válidos
    And marcar a opção 'Permanecer Logado'
    Then sempre que acessar a aplicação, não será necessário logar novamente

  Scenario Outline: Fluxo de recuperação de senha
    When clicar no botão 'Esqueci minha senha'
    And digitar <email>
    Then irá aparecer a seguinte mensagem: <texto>

    Examples:
      | email                   | texto                                                               |
      | "felipez7989@gmail.com" | "O código para troca de senha foi enviado para o e-mail informado." |
      | "invalido@gmail.com"    | "Usuário não encontrado"                                            |

  Scenario Outline: Login sem sucesso
    When digitar <email> e <senha>
    And clicar em Entrar
    Then irá aparecer a seguinte mensagem: <texto>

    Examples:
      | email                   | senha           | texto                    |
      | "invalido@gmail.com"    | "senhaValida"   | "Usuário não encontrado" |
      | "felipez7989@gmail.com" | "senhaInvalida" | "Acesso não autorizado." |