Feature: Manter perfis
    Funcionalidade que permite que usuários administradores da Plataforma Adaptativa façam a gestão de perfis

    Background: 
        Given Acessar o ambiente da Plataforma adaptativa
        When Clicar em Perfis no menu lateral

    Scenario: Criando um perfil com sucesso
        When Clicar no botão Novo perfil
        And Preencher os campos Nome e Descrição
        And Selecionar as permissões desejadas para atribuir ao perfil
        And Clicar em Salvar 
        Then Deve aparecer uma notificação dizendo que o perfil foi salvo com sucesso

    Scenario: Tentativa de criar um perfil com um nome já atribuido a outro perfil
        When Clicar no botão Novo perfil
        And Preencher o campo Nome com o nome de outro perfil já cadastrado
        And Selecionar as permissões desejadas para atribuir ao perfil
        And Clicar em Salvar 
        Then Deve aparecer uma notificação dizendo que já existe um perfil cadastrado com o nome informado

    Scenario: Tentativa de criar um perfil sem permissões
        When Clicar no botão Novo perfil
        And Preencher os campos Nome e Descrição
        But Não selecionar qualquer permissão
        And Clicar em Salvar
        Then Deve aparecer uma notificação dizendo que é necessário selecionar pelo menos uma permissão

    Scenario: Tentativa de criar um perfil padrão havendo um perfil padrão já cadastrado
        When Clicar no botão Novo perfil
        And Preencher os campos Nome e Descrição
        And Selecionar as permissões desejadas para atribuir ao perfil
        And Marcar o checkbox Padrão
        And Clicar em Salvar
        Then Deve aparecer uma notificação dizendo que já existe um perfil cadastrado como padrão

    Scenario: Inativando um perfil
        When Clicar em editar um perfil
        And Clicar em Inativar perfil
        And Clicar em OK na janela que abriu para confirmar a inativação
        Then Deve aparecer uma notificação dizendo que o perfil foi inativado com sucesso

    Scenario: Inativando um perfil associado a um usuário
        When Clicar em editar um perfil que está associado a algum usuário
        And Clicar em Inativar perfil
        And Clicar em OK na janela que abriu para confirmar a inativação
        Then Deve aparecer uma notificação dizendo que não é possível inativar um perfil que tenha um usuário ativo já associado