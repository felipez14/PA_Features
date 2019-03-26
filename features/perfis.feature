Feature: Manter perfis
    Funcionalidade que permite que usuários administradores da Plataforma Adaptativa façam a gestão de perfis

    Scenario: Criando um perfil com sucesso
        Given Acesso o ambiente da Plataforma adaptativa
        When Clico em Perfis no menu lateral
        And Clico no botão Novo perfil
        Then Preencho os campos Nome e Descrição
        And Seleciono as permissões desejadas para atribuir ao perfil
        And Clico em Salvar 
        Then Recebo uma notificação dizendo que o perfil foi salvo com sucesso

    Scenario: Tentativa de criar um perfil com um nome já atribuido a outro perfil
        Given Acesso o ambiente da Plataforma adaptativa
        When Clico em Perfis no menu lateral
        And Clico no botão Novo perfil
        Then Preencho o campo Nome com o nome de outro perfil já cadastrado
        And Seleciono as permissões desejadas para atribuir ao perfil
        And Clico em Salvar 
        Then Recebo uma notificação dizendo que já existe um perfil cadastrado com o nome informado

    Scenario: Tentativa de criar um perfil sem permissões
        Given Acesso o ambiente da Plataforma adaptativa
        When Clico em Perfis no menu lateral
        And Clico no botão Novo perfil
        Then Preencho os campos Nome e Descrição
        And Não seleciono qualquer permissão
        And Clico em Salvar
        Then Recebo uma notificação dizendo que devo selecionar pelo menos uma permissão

    Scenario: Tentativa de criar um perfil padrão havendo um perfil padrão já cadastrado