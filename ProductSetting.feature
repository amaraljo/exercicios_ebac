Feature: Configurar Produto

    Background: 
        Given o usuário está logado na aplicação 

    Scenario Outline: Validação de fluxo de inserir produto no carrinho 
        When usuário selciona <size> e <color> 
        And clica em comprar 
        Then deve exibir uma mensagem "Produto inserido no carrinho!"

        Examples:
            | size | color | 
            | XS   | Blue  | 
            | S    | Organe|
            | M    | Red   |
            | L    |
            | XL   |

#Cenário tentar clicar em comprar sem campos obrigatórios
    Scenario: Validação de campos obrigatórios
        When usuário clica em comprar
        Then deve exibir mensagem "Selecione tamanho e cor para inserir no carrinho"

#Cenário tentar inserir prduto sem selecionar campo cor
    Scenario Outline: Validação do campo obrigatório cor
        When usuário selciona <size>
        And clica em comprar
        Then deve exibir mensagem "Selecione a cor para inserir produto no carrinho"

        Examples:
            |color  | 
            | Blue  | 
            | Organe|
            | Red   |

#Cenário tentar inserir produto no carrinho sem compo tamanho
    Scenario Outline: Validação da campo obrigatório tamanho
        When usuário selciona <ciolor>
        And clica em comprar
        Then deve exibir mensagem "Selecione tamanho para inserir produto no carrinho"

        Examples:
            |color  | 
            | Blue  | 
            | Organe|
            | Red   |

    Scenario Outline: Validação de quantidade válida de produtos inseridos
        When usuários seleiona <color> e <size> 
        And insere a quantidade 10 
        Then deve exibir a mensagem "Produtos inseridos no carrinho!"

        Examples:
            | size | color | 
            | XS   | Blue  | 
            | S    | Organe|
            | M    | Red   |
            | L    |
            | XL   |

#Cenário inserir quantidade 2 do mesmo produto no carrinho 
    Scenario Outline: Validação de quantidade mínima de produtos ineridos
        When usuários seleiona <color> e <size> 
        And insere a quantidade 2 
        Then deve exibir a mensagem "Produtos inseridos no carrinho!"

        Examples:
            | size | color | 
            | XS   | Blue  | 
            | S    | Organe|
            | M    | Red   |
            | L    |
            | XL   |

#Cenário inserir cor e tamanho e clicar em limpar 
    Scenario Outline: Validação do cammpo limpar
        When usuários seleiona <color> e <size> 
        And clica em limpar 
        Then as opções deverão ser desmarcadas
    
        Examples:
            | size | color | 
            | XS   | Blue  | 
            | S    | Organe|
            | M    | Red   |
            | L    |
            | XL   |

#Cenário inserir cor e clicar em limpar 
    Scenario Outline: Validação do cammpo limpar
        When usuários seleiona <color>  
        And clica em limpar 
        Then a opção deve ser desmarcada
    
        Examples:
            | color | 
            | Blue  | 
            | Organe|
            | Red   |

#Cenário inserir tamanho e clicar em limpar 
    Scenario Outline: Validação do cammpo limpar
        When usuários seleiona <color>  
        And clica em limpar 
        Then a opção deve ser desmarcada
        
        Examples:
            | size |  
            | XS   |  
            | S    |
            | M    | 
            | L    |
            | XL   |    
            
