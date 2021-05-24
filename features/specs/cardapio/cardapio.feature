    #language: pt
    #@temp
    Funcionalidade: Cardápio
        Para que eu possa decidir o que pretendo comer 
        Sendo um usuário que escolheu um restaurante 
        Posso acessar o cardápio 
    
    Contexto: Restaurantes
        Dado que eu acesso a lista de restaurantes

        @cardapio
        Cenario: Produto 
            
            Quando eu escolho o restaurante "Burger House"
            Então vejo os seguintes itens disponíveis no cardápio:
            | produto        | descricao                       | preco    |
            | Classic Burger | O clássico. Não tem como errar. | R$ 18,50 |
            | Batatas Fritas | Batatas fritas crocantes        | R$ 5,50  |
            | Refrigerante   | O refri mais gelado da cidade.  | R$ 4,50  |
         #nesse cenário temos uma tabela do tipo colunas
         
         
        
         Cenario: Carrinho vazio 

            Quando eu escolho o restaurante "Burger House"
            Então vejo a seguinte mensagem no carrinho "Seu carrinho está vazio!"



           




        #BDD (Comportamento):
        #Cenário com Exemplos

        #Tradicional:
        #Casos de Uso (Doc/Espec) => Cria o app
        #Plano de teste (Casos de teste) => Testa o app
        #Massa de testes => Imput de dados no app




