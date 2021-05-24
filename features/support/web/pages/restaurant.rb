class RestaurantPage 
    include Capybara::DSL
    
    def details
        find("#detail")
    end

    def menu
        #traz a lista de produtos ao selecionar um restaurante
        all(".menu-item-info-box")
    end

    def add_to_cart(nome)
        #para adicionar o evento de click temos que usar o css selector para encontrar o botão
        #porem ao inspecionar o elemento no HTML, percebeu-se que a busca por ele retornava 3
        #elementos de botão, que serão dos outros produtos. logo buscou-se um outro seletorn
        #nesse caso foi o seletor da classe pai, uma Div, responsável por todo o elemento. A
        #partir dela foi possível acessar o botão de adicionar certo.
    
        find(".menu-item-info-box", text: nome.upcase).find(".add-to-cart").click
    end

    #como o 'carrinho' representa uma sessão da página de restaurante, logo ele é instanciado
    #aqui em restaurante, desse forma fica tudo mais organizado e segue o padrão do Page Object
    def cart
        CartView.new
    end
end