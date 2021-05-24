require "base64"

#Before responsável por redimensionar o tamanho da tela de execução do código
#ou seja, da página web que irá abrir
Before do
  page.current_window.resize_to(1440, 900)
   
  #para essa instancia temos o objeto que representa um restaurante, ou seja,
  #partindo da lista de restaurantes eu selecionei um deles e agora posso ter 
  #acesso a suas informações na descrição, como também ao seu menu. Segue o 
  #padrão "Page Object"
  @rest_page = RestaurantPage.new
  #=============================================================================
   #instancia de um objeto que representa a lista de restaurantes na área da 
   #página web, é usado a arquitetura do Page Object. Trazendo métodos usados
   #nos steps, e encapsulando numa classe que representa essa funcionalidade, 
   #nesse caso, a lista de restaurantes. Torna muito melhor a manutenção do 
   #código depois 
   @rest_list_page = RestaurantListPage.new
  #==============================================================================
  #Variável de instância que traz o objeto da classe que representa a página de 
  #fechamento de pedidos
  @order_page = OrderPage.new
end

#temos aqui um 'hook' ele é um tipo de gancho que faz executar alguma parte
#do sistema primeiro,nesse caso, antes de começar a rodar os steps de teste,
#irá vir para o método 'Before' de modo que abra a página do restaurante que
#será usado para testes e que tem a massa de testes. Só virá para cá as funci-
#onalidades que tiverem com a tag. O before será exetado toda vez que for roda-
#do um cenário
Before("@bread") do
  visit "/restaurants/bread-bakery/menu"
end

Before("@green_food") do
  visit "/restaurants/green-food/menu"
end

#é o gancho de pós execução do cenário
After  do |scenario|
  
  #o comando "scenario.failed?" retorna um booleano "true", caso o cenário,
  #falhe, se quiser analisar pelos os que deram certo é só usar "scenario.
  #failed?"
  
  if  scenario.failed?
    #comando que tem a função de tira um screenshot de cada execução do cenário 
    shot_file = page.save_screenshot("log/screenshot.png")
  
    #lê um arquivo de imagem (screenshot) e converte para Base64(formato binário),
    #e grava o resultado em shot_b64
    shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
    
    #método do cucumber que anexa coisas no relatório,, nesse caso o screenshot 
    #gerado e ja convertido para binário
    embed(shot_b64, "image/png", "Screenshot")
  end
end 