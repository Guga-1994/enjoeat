Dado("que temos os seguintes Restaurantes") do |table|
  #trabalhar com a tabela do jeito que ela vem na documentação fica difícil
  #logo se faz necessario mudar a forma de apresentação dos dados, será usado
  #o recurso de ".hashes", para alterar esse formato
  @restaurant_data = table.hashes
  puts table.class
end

Quando("acesso a lista de restaurantes") do
  @rest_list_page.load
end

Então("devo ver todos os restaurantes desta lista") do
  restaurantes = @rest_list_page.list

  @restaurant_data.each_with_index do |value, index|
    expect(restaurantes[index]).to have_text value["nome"].upcase
    expect(restaurantes[index]).to have_text value["categoria"]
    expect(restaurantes[index]).to have_text value["entrega"]
    expect(restaurantes[index]).to have_text value["avaliacao"].to_i
  end
end
