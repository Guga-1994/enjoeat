            #language: pt
            #essa linhas seguintes não são executadas pelo cucumber, é apenas
            #decumentação.
            Funcionalidade: Restaurantes
            Para que eu possa saber quais os restaurantes disponíveis com o tempo entrega e nota de avaliação
            Sendo um usuário que desejo pedir comida
            Posso acessar a lista de restaurantes

            #========================================================================================================
            #Outra opção de validação dos dados seria descrever os cenários de testde no formado BDD,
            #como abaixo, porem o esquema de cenário se mostrou mais interessante,visto que os cenarios
            #apresentavam o mesmo comportamento, sendo o esquema de cenário a melhor forma de organizar

            #Contexto: Lista de restaurantes
            #Dado que tenho uma lista de restaurantes

            #Cenario: Todos os restaurantes

            #Quando acesso a lista de restaurantes
            #Então vejo todas as opções disponíveis

            #Cenario: Categorias

            #Quando acesso a lista de restaurantes
            #Então cada restaurante deve exibir sua Categoria

            #Cenario: Tempo de entrega

            #Quando acesso a lista de restaurantes
            #Então cada restaurante deve exibir o tempo de entrega

            #Cenario: Nota de avaliação

            #Quando acesso a lista de restaurantes
            #Então cada restaurante deve exibir sua nota de avaliação
            #============================================================================================================

            #=============================================================================================================
            #no esquema do cenário temos que a cada linha é aberto o navegador, simulando
            #a ação de um usuário ao acessar a página. Ou seja, nesse caso que temos que
            #testar cada estabecimento, não faz sentido que feche a página a cada empresa
            #verificada, não sendo o comportamento normal do usuário, pois o usuário não
            #abre o navegador e acessa uma opção de empresa, e depois fecha o navegador
            #para acessar outra. Para cada execução temos uma simulação de usuário acessan-
            #do a página. O ideal seria que numa seção só poder ver todos as empresas. Eu posso
            #usar o esquema de usuário quando eu realmente quiser simular vários usuários
            #diferentes, como em cadastro de usuário (nome, cpf, senha...), teste em uma loja
            #virtual para fazer várias compras, exemplo na terceira compra tem desconto, nesse caso 
            #faz sentido usar o esquema de usuário. 
            #@temp
            #Esquema do Cenario: Restaurantes disponíveis

            #Quando acesso a lista de restaurantes
            #Então cada restaurante deve ter <id> <nome> <categoria> <entrega> <avaliacao>

            #Exemplos:
            #| id | nome             | categoria    | entrega      | avaliacao |
            #| 0  | "Bread & Bakery" | "Padaria"    | "25 minutos" | 4.9       |
            #| 1  | "Burger House"   | "Hamburgers" | "30 minutos" | 3.5       |
            #| 2  | "Coffee Corner"  | "Cafeteria"  | "20 minutos" | 4.8       |
            #=============================================================================================================
             

            #quando se trabalha com tabelas em steps, se entende que os elementos são todos strings
            #logo precisa fazer os tratamentos de algum dado que seja de outro tipo, nesse caso avalia-
            #ção que são tipo int/float. Nesse cenário a tabela é passada como argumento, como parâmetro.
            #@temp
            Cenario: Restaurantes disponíveis

                Dado que temos os seguintes Restaurantes
                    | nome           | categoria  | entrega    | avaliacao |
                    | Bread & Bakery | Padaria    | 25 minutos | 4.9       |
                    | Burger House   | Hamburgers | 30 minutos | 3.5       |
                    | Coffee Corner  | Cafeteria  | 20 minutos | 4.8       |
                
                Quando acesso a lista de restaurantes
                Então devo ver todos os restaurantes desta lista