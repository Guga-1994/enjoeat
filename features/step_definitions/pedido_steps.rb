
Dado('que eu fechei o pedido com os itens:') do |table|
    #para fechar o pedido eu preciso adicionar os itens ao carrinho (passo feito
    #pelo step "Quando eu adiciono todos os itens") e fechar o carrinho ( feito
    #pela ação "close" do objeto cart que esta dentro do step "Quando eu fecho 
    #o meu carrinho", que aciona o botão de fechar pedido)
    
    @product_list = table.hashes
    steps %(
        Quando eu adiciono todos os itens
    )
    @rest_page.cart.close
  end
  
  Dado('informei os meu dados de entrega:') do |table|
    #como a tabela é do tipo chave/valor, ai tem que usar o método ".rows_hash",
    #diferente do tipo de tabela de colunas que usa o método ".hashes"
    user = table.rows_hash
    @order_page.fill_user_data(user)
    sleep 5
  end
  
  Quando('eu finalizo o pedido com {string}') do |payment|
    @order_page.checkout(payment)
  end
  
  Então('devo ver a seguinte mensagem:') do |expect_message|
    expect(@order_page.summary).to have_text expect_message
  end