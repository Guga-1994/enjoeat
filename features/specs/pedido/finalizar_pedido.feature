#language:pt 
@green_food 
Funcionalidade: Finalizar pedido
    Para que eu possa recer o pedido no meu endereço
    Sendo um usuário que fechou o carrinho com itens
    Posso finalizar o meu pedido

    #BDD (Desenvolvimento baseado por comportamento)=>voltado para o negócio 
    #BDT (Teste guiado por comportamento)=>voltado apenas para o teste, modelo ultrapassado
    #sai do modelo tradicional, para o modelo que traz o valor ao negócio
    #deixo de somente achar bugs, passa a atuar com estratégia 
     
    #é um dos cenários mais importantes e principais
    @smoke
    Cenario: Finalizar pedido com o cartão Refeição

        Dado que eu fechei o pedido com os itens:
            | quantidade | nome                | descricao                                | subtotal |
            | 1          | Suco Detox          | Suco de couve, cenoura, salsinha e maça. | R$ 14,90 |
            | 2          | Hamburger de Quinoa | Cheio de fibras e muito saboroso.        | R$ 21,00 |
        E informei os meu dados de entrega:
            | nome              | Gustavo                  |
            | email             | eu@guga.io               |
            | confirmacao_email | eu@guga.io               |
            | rua               | Rua Jose Florentino Neto |
            | numero            | 07                       |
            | complemento       | casa                     |
        Quando eu finalizo o pedido com "Cartão Refeição"
        Então devo ver a seguinte mensagem:
        #doc string: recurso para usar mensagem maiores.
        """
        Seu pedido foi recebido pelo restaurante. Prepare a mesa que a comida está chegando!
        """
