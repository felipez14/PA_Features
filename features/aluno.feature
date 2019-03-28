Feature: Gestão de Aluno
    Funcionalidade que permite que um usuário administrador possa fazer a gestão de alunos na Plataforma adaptativa

    Background: 
        Given Acesso o ambiente da Plataforma adaptativa
        When Clico em Acadêmico no menu lateral

    Scenario: Criando um aluno com sucesso (gerando credenciais de acesso)
        Given Clicar no botão Novo aluno e acessar a tela de criação de aluno
        When Preencher todos os dados necessários para o cadastro de um novo aluno
        And Clicar no botão Salvar
        Then O aluno será cadastrado com sucesso