Feature: Pesquisa
    Funcionalidade que permite realizar a pesquisa de cursos e documentos na Plataforma Adaptativa

    Background: 
        Given Acessar o ambiente da Plataforma adaptativa

    Scenario: Realizando a pesquisa de um manual técnico
        When Pesquisar sobre um manual técnico
        Then Receber os resultados do manual pesquisado

    Scenario: Realizando a pesquisa de um curso
        When Pesquisar sobre um curso
        Then Receber os resultados do curso pesquisado

    Scenario: Realizando uma pesquisa através do campo presente na tela de inicio
        When Fazer uma pesquisa qualquer através do campo presente na tela de inicio
        Then Ser redirecionado para a tela de resultados contendo os dados da pesquisa feita