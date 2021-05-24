class RestaurantListPage
    include Capybara::DSL

    def load
        visit "/restaurants"
    end

    def go(restaurant)
        #através do css selector ".restaurant-item", que traz um array de elementos, nesse caso
        #os restaurantes disponíveis no app. Quando eu uso o recurso do "text", eu consigo espe-
        #cificar qual restaurante eu quero, e depois uso o recurso do click para poder acessar a
        # área do cardápio. Como a página demora para carregar e o capybara é mais rápido acontece
        #que o capybara naão encontra os elementos. Dessa forma o sleep resolve esse gap. Tem que
        #se usar o ".upcase" para tornar o nome do restaurante maiusculo, ja que esta assim no layout
        #da página
        find(".restaurant-item", text: restaurant.upcase).click
        #find(".place-info-box", text: restaurant.upcase).click
    end

    def list
        all(".restaurant-item")
    end
end