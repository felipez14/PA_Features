Feature: Tela de arquivos e visualizador de PDF
    Funcionalidade que permite buscar e visualizar os arquivos na Plataforma adaptativa

    Background: 
        Given Acessar o ambiente da Plataforma adaptativa

    Scenario: Acessando um arquivo 
        When Clicar em Arquivos no menu lateral
        And Ver na tela todos os arquivos disponiveis na Plataforma adaptativa
        And Selecionar o arquivo desejado
        Then Abre a tela de Visualizador de PDF onde é possível navegar pelo arquivo selecionado