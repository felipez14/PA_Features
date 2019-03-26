Feature: Fale Conosco
    Funcionalidade que permite que o usuário envie duvidas, sugestões, elogios ou bugs para o suporte da Plataforma adaptativa

    Scenario: Enviando uma mensagem qualquer com sucesso
        Given Acesso o ambiente da Plataforma adaptativa
        When Clico no botão flutuante da funcionalidade localizado no canto inferior direito
        And Seleciono uma das opções - Dúvida, sugestão, elogio ou erro
        Then Preencho os campos de Assunto e Mensagem
        And Opcionalmente, anexo uma imagem
        And Clico no botão Enviar
        Then Recebo uma notificação dizendo que minha mensagem foi enviada

    Scenario: Tentativa de enviar uma mensagem sem preencher os campos obrigatórios
        Given Acesso o ambiente da Plataforma adaptativa
        When Clico no botão flutuante da funcionalidade localizado no canto inferior direito
        And Seleciono uma das opções - Dúvida, sugestão, elogio ou erro
        Then Não preencho os campos de Assunto e Mensagem
        When Clico no botão Enviar
        Then Recebo uma notificação dizendo que preciso preencher os campos obrigatórios