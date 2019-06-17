Feature: Gestão de Aluno
    Funcionalidade que permite que um usuário administrador possa fazer a gestão de alunos na Plataforma adaptativa

    Background: 
        Given Acessar o ambiente da Plataforma adaptativa

    Scenario: Criando um aluno com sucesso (gerando credenciais de acesso)
        Given Acessar a tela de Novo aluno
        When Preencher todos os dados necessários para o cadastro de um novo aluno
        And Clicar no botão Salvar
        Then O aluno será cadastrado com sucesso