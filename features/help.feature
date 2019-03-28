Feature: Fale Conosco
    Funcionalidade que permite que o usuário envie dúvidas, sugestões, elogios ou bugs para o suporte da Plataforma adaptativa

    Background: 
        Given Acessar o ambiente da Plataforma adaptativa
        When Clicar no botão flutuante da funcionalidade localizado no canto inferior direito
        And Selecionar uma das opções - Dúvida, sugestão, elogio ou erro

    Scenario: Enviando uma mensagem qualquer com sucesso
        When Preencher os campos de Assunto e Mensagem
        And Opcionalmente, anexar uma imagem
        And Clicar no botão Enviar
        Then Deve aparecer uma notificação dizendo que a mensagem foi enviada

    Scenario: Tentativa de enviar uma mensagem sem preencher os campos obrigatórios
        But Não preencher os campos de Assunto e Mensagem
        When Clicar no botão Enviar
        Then Deve aparecer uma notificação dizendo que é preciso preencher os campos obrigatórios