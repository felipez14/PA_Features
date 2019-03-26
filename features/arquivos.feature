Feature: Tela de arquivos e visualizador de PDF
    Funcionalidade que permite buscar e visualizar os arquivos na Plataforma adaptativa

    Scenario: Acessando um arquivo 
        Given Acesso o ambiente da Plataforma adaptativa
        When Clico em Arquivos no menu lateral
        Then Vejo na minha tela todos os arquivos disponiveis na Plataforma adaptativa
        When Eu seleciono o arquivo que desejo
        Then Sou direcionado para a tela de Visualizador de PDF onde poderei navegar pelo arquivo selecionado