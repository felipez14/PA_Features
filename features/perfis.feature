Feature: Manter perfis
    Funcionalidade que permite que usuários administradores da Plataforma Adaptativa façam a gestão de perfis

    Background: 
        Given Acesso o ambiente da Plataforma adaptativa
        When Clico em Perfis no menu lateral

    Scenario: Criando um perfil com sucesso
        And Clico no botão Novo perfil
        Then Preencho os campos Nome e Descrição
        And Seleciono as permissões desejadas para atribuir ao perfil
        And Clico em Salvar 
        Then Recebo uma notificação dizendo que o perfil foi salvo com sucesso

    Scenario: Tentativa de criar um perfil com um nome já atribuido a outro perfil
        And Clico no botão Novo perfil
        Then Preencho o campo Nome com o nome de outro perfil já cadastrado
        And Seleciono as permissões desejadas para atribuir ao perfil
        And Clico em Salvar 
        Then Recebo uma notificação dizendo que já existe um perfil cadastrado com o nome informado

    Scenario: Tentativa de criar um perfil sem permissões
        And Clico no botão Novo perfil
        Then Preencho os campos Nome e Descrição
        But Não seleciono qualquer permissão
        And Clico em Salvar
        Then Recebo uma notificação dizendo que devo selecionar pelo menos uma permissão

    Scenario: Tentativa de criar um perfil padrão havendo um perfil padrão já cadastrado
        And Clico no botão Novo perfil
        Then Preencho os campos Nome e Descrição
        And Seleciono as permissões desejadas para atribuir ao perfil
        And Marco o checkbox Padrão
        And Clico em Salvar
        Then Recebo uma notificação dizendo que já existe um perfil cadastrado com padrão

    Scenario: Inativando um perfil
        And Clico em editar o perfil que desejo inativar
        Then Clico em Inativar perfil
        And Clico em OK na janela que abriu para confirmar a inativação
        Then Recebo uma notificação dizendo que o perfil foi inativado com sucesso

    Scenario: Inativando um perfil associado a um usuário
        And Clico em editar o perfil associado que desejo inativar 
        Then Clico em Inativar perfil
        And Clico em OK na janela que abriu para confirmar a inativação
        Then Recebo uma notificação dizendo que não é possível inativar um perfil que tenha um usuário ativo já associado