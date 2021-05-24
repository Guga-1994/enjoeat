class OrderPage
    include  Capybara::DSL
    
    #busca o frete
    def cost_shipping
        #Essa é o css selector que  enconrtra as informações de fechamento como itens,
        #frete e tatal: "div[class*=col-sm-6]:contains('Frete e Total:')" , porém 
        #o css selector tem que ser adaptado, pq tem recursos que o capybara não re-
        #conhece, como é o caso do "contains". Esse css selector traz apenas a "Div"
        #pai para que a gente tenha acesso as tr que contem as informações de fechamento 
       div =  find("div[class*=col-sm-6]", text: "Frete e Total:")
       
       #o método  retornará um array de elementos 
       div.all("table tbody tr")
    end 
    
    #método que preenche a informnação do nome do usuário no  campo "nome". Foi usado 
    #o css selector "input[formcontrolname=name]", onde o "input" indica o tipo do ele-
    #mento, representando a Div, e o 'formcontrolname é um elemento presente na Div que 
    #pode ser usado para chegar até o campo. O restante dos inputs seguem a mesma ideia.
    def fill_user_data(user)
        find("input[formcontrolname=name]").set user[:nome]
        find("input[formcontrolname=email]").set user[:email]
        find("input[formcontrolname=emailConfirmation]").set user[:confirmacao_email]
        find("input[formcontrolname=address]").set user[:rua]
        find("input[formcontrolname=number]").set user[:numero]
        find("input[formcontrolname=optionalAddress]").set user[:complemento]  
    end
    
    #seleciona o tipo de pagamento 
    def select_pay(payment)
        #css selector para descobrir qual é a opção de pagamento, visto que tem uma forma-
        #tação diferente para essa seção.

        payopt = find("mt-radio[formcontrolname=paymentOption]")
        #payopt.find('div:contains("Cartão Refeição") div')
        payopt.find('div', text: payment).find('div').click
    end
    
    #finalizar pedido 
    def checkout(payment)
        self.select_pay(payment)
        click_button "Finalizar Pedido"
    end 

    def summary
        find('.content')
    end
end