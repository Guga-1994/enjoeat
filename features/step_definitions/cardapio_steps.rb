Dado("que eu acesso a lista de restaurantes") do
  @rest_list_page.load
end

Quando("eu escolho o restaurante {string}") do |restaurante|
 @rest_list_page.go(restaurante)
end

Então("vejo os seguintes itens disponíveis no cardápio:") do |table|

  #para recuperar as informações sobre os itens na página do restaurante é usado o css selector
  #".menu-item-info-box", ela representa uma "Div class" que contém os itens.
  itens = @rest_page.menu

  #a 'table' representa a massa de teste, e ela está sendo modificada e transformada em hash
  #pelo recurso ".hashes", pois dessa forma eu consigo trabalhar com os dados usando os recur-
  #sos do capybara, ruby e rspec.
  produto_data = table.hashes

  produto_data.each_with_index do |value, index|
    expect(itens[index]).to have_text value["produto"].upcase
    expect(itens[index]).to have_text value["descricao"]
    expect(itens[index]).to have_text value["preco"]
  end
end

Então("eu vejo as seguintes informações adicionais:") do |table|
  #como temos uma massa de dados organizados em uma tabela do tipo chave e valor,
  #devemos ter cuidado para manipular os dados, pois a implementação do código é
  #um pouco diferente do que usamos para as tabelas do tipo coluna. Primeiro que
  #agora não teremos mais vários "hashes", como temos nas tabelas de coluna, mas
  #sim, uma única linha de hash, por isso usamos o recurso ".rows_hash":
  #"categoria"=>"Hamburgers", "descricao"=>"40 anos se especializando em trash food.",
  #"horarios"=>"Funciona todos os dias, de 10h às 22h"}
  infos = table.rows_hash
  detail = @rest_page.details
  expect(detail).to have_text infos["categoria"]
  expect(detail).to have_text infos["descricao"]
  expect(detail).to have_text infos["horarios"]
end
