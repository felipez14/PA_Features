Feature: Funcionalidade de pesquisa
    Funcionalidade que permite realizar a pesquisa de cursos e documentos na Plataforma Adaptativa

    Background: 
        Given Acesso o ambiente da Plataforma adaptativa

    Scenario: Realizando a pesquisa de um manual técnico
        When Pesquiso sobre um manual técnico
        Then Recebo os resultados do manual pesquisado

    Scenario: Realizando a pesquisa de um curso
        When Pesquiso sobre um curso
        Then Recebo os resultados do curso pesquisado

    Scenario: Realizando uma pesquisa através do campo presente na tela de inicio
        When Faço uma pesquisa qualquer através do campo presente na tela de inicio
        Then Sou redirecionado para a tela de resultados contendo os dados da pesquisa feita