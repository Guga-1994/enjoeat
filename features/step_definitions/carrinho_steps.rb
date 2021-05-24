Dado("que o produto desejado é {string}") do |produto|
  @produto_nome = produto
end

Dado("o valor do produto é de {string}") do |valor|
  @produto_valor = valor
end

Quando("eu adiciono {int} unidade\\(s)") do |quantidade|

  #foi usado o recurso ".times" que é um laço de repetição do ruby, assim como (for, while),
  #sendo que o laço vai iterar o número de vezes que a "quantidade" trouxer comno valor. Pois
  #se for mais de um produto do mesmo adicionado ao carrinho, o times possibilitará fazer o
  #a verificação.
  quantidade.times do
   @rest_page.add_to_cart(@produto_nome)
  end
end

Então("deve ser adicionado {int} unidade\\(s) deste item") do |quantidade|
  #para sabermos se realmente o produto foi adicionado no carrinho, é necessario verificar
  #se a mensagem mostrada no elemento carrinho, está aparecendo: "(1x) Cup Cake". Para aces-
  #sar o elemento carrinho, foi usado um css selector usando um "id", disponível no código.
  #E para o teste foi usado a interpolação de string, fazendo a concatenação das informações
  #das variáveis para forma a string de comparação.
  expect(@rest_page.cart.box).to have_text "(#{quantidade}x) #{@produto_nome}"
end

Então("o valor total deve ser de {string}") do |valor_total|
  expect(@rest_page.cart.total.text).to eql valor_total
end

#Trabaremos agora com uma "lista de produtos", dessa forma, os steps serão um pouco diferentes

Dado("que os produtos desejados são:") do |table|
  #a variável de instância "@product_list" vai se transformar num array de hashes, representando
  #os produtos adicionados ao carrinho
  @product_list = table.hashes
end

Quando("eu adiciono todos os itens") do
  #percorre a lista de produtos e vai adicionando-os ao carrinho. Através da chave "quantidade"
  #presente nos elementos do hash de produto, é possivel indicar quantos de cada tipo de produtos
  #serão adicionados ao carrinho, tornando o teste mais interessante. Nesse caso foi usado o re-
  #curso de ".times" para fazer a iteração.
  @product_list.each do |produto|
    produto["quantidade"].to_i.times do
      @rest_page.add_to_cart(produto["nome"])
    end
  end
end

Então("vejo todos os itens no carrinho") do
  @product_list.each do |produto|
    expect(@rest_page.cart.box).to have_text "(#{produto["quantidade"]}x) #{produto["nome"]}"
  end
end

#Remover itens

Dado("que eu tenho os seguintes itens no carrinho:") do |table|
  @product_list = table.hashes
  #é usado aqui um dynamic step , é quando dentro de um método eu chamo um BDD, 
  #ou seja eu chamo o proprio método. Pois tinhamos dois steps fazendo a mesma 
  #coisa, o "Quando eu adiciono todos os itens" e "Dado que eu tenho os seguintes
  #itens no carrinho", ambos tinham o código que adicionava todos os itens no car
  #rinho, e isso deixa o codigo muito engessado e dificil de dar manuntenção depois
  #caso precizasse fazer alguma alteração no código, teria que modificar nos dois 
  #métodos. Com o "dynamic step" eu pude chamar o codígo do "Quando eu adiciono 
  #todos os itens" e usar aqui, como um reuso de código, caso tenha alguma alteração
  #eu so preciso modificar nele.
  steps %(
    Quando eu adiciono todos os itens 
  )
end

Quando('eu removo somente o {int}') do |item|
  @rest_page.cart.remove_item(item)
end

                                                                              
Quando('eu removo todos os itens') do    
                        
  @product_list.each_with_index do |value, idx|
    @rest_page.cart.remove_item(idx)
    sleep 2
  end
end

Quando('eu limpo o meu carrinho') do 
  @rest_page.cart.clean
end                                                                           
                                                                              
Então('vejo a seguinte mensagem no carrinho {string}') do |mensagem|            
  expect(@rest_page.cart.box).to have_text mensagem
end        




#fechamento do carrinho 

Dado('que adicionei os seguintes itens no carrinho:') do |table|               
  @product_list = table.hashes
  #será usado o Dynamic Step, uma vez que o código de adicionar elementos ao 
  #carrinho ja foi implementado em um step anterior: "Quando eu adiciono todos
  #os itens"
  steps %(
      Quando eu adiciono todos os itens
  )
end                                                                            
 
Quando('eu fecho o meu carrinho') do       
  @rest_page.cart.close                                    
end                                                                            
                                                                               
Então('o valor total de itens dever ser igual a {string}') do |total_itens|
  expect(
  @order_page.cost_shipping[0]
  ).to have_text total_itens
end                                                                            
                                                                               
Então('o valor do frete deve ser igual a {string}') do |shipping|                
  expect(
    @order_page.cost_shipping[1]
    ).to have_text shipping
end                                                                            
                                                                               
Então('o valor total da compra deve ser igual a {string}') do |total_cart|         
  expect(
    @order_page.cost_shipping[2]
    ).to have_text total_cart
end                                                                            