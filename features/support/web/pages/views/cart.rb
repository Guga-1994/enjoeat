#A classe CartPage representa a áre do carrinho, foi pensando na capacidade de 
#manuntenção do código, pq muitos dos steps usam a busca pelo "id" da "div" do
#carrinho. logo se a 'div' muda, teria que alterar vários steps e isso não é 
#interessante. Criando uma classe que representa o carrinho e dentro dela criando
# uma ação (método) que retorne o id, seria legal, pois sempre que mudar o id, eu 
#só preciso alterar a classe. Essa ideia vem de um padrão de projeto chamado "Page
# Object"


class CartView
    #como essa classe foi feita a mão, ou seja, fora da camada reconhecida pelo "capybara", ela não
    #reconhece o comando "find". Os outros arquivos do "specs" reconhecem os comandos capybara 
    #pois ele está incluido no arquivo "env.rb" na pasta de 'support'. Como esse arquivo está na pasta
    #"web/pages" tem que includir o capybara aqui através do código "include: Capybara::DSL"
    include Capybara::DSL

    def box 
        find("#shopping-cart") 
        #find("#shopping-cart")  

    end 

    def total
        #essa linha de código pega a área do elemento carrinho que contem a informação de total,
        #como o elemento carrinho foi criado usando o código de tabela (uso de "tr td th").
        #<tr>
        #          <th>Total:</th>
        #         <td class="text-right">R$&nbsp;8,70</td>
        #</tr>
        #busca pela classe pai "tr" com o texto "Total" e depois a tag filha "td" que contem o
        #valor de total 
        box.find("tr", text: "Total:").find("td")
    end

    def remove_item(item)
        #para buscar os itens do carrinho foi necessario usar o css selector "table tbody tr", onde
        #'table' representa a classe pai, 'tbody' a proxima div filha, e 'tr' representa as linhas
        #da tabela que contem as informações dos produtos adicionais ao carrinho. O recurso ".all"
        #vai trazer para a variável 'cart' um array de elementos adicionados ao carrinho. Para gerar
        #a remoção de um elemento é necessario clicar no botão em formato de 'x', que fica ao lado
        #do produto adicionado ao carrinho. Esse botão ao ser inspecionado apresenta uma classe 
        #chamada "danger", sendo essa a informação usada para gerar o evento de click de remoção.
        box.all("table tbody tr")[item].find(".danger").click
    end

    def clean
        #o recurso de limpar o carrinho é representado por um botão com o texto "Limpar", logo é 
        #necessário apenas acionar o evento de click "click_button"  e passar o texto do botão.                                    
        click_button "Limpar"
    end
    
    def close
        #para fechar o carrinho, temos um elemento com o texto "Fechar Pedido", ele se tem o 
        #designer de um botão(manipulação do css bootstrap), mas é um link por baixo, logo
        #é usado o recurso de "Click.link" e não "Click.button"
        click_link "Fechar Pedido"
    end

end

