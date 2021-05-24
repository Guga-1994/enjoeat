require "time" #biblioteca no ruby para podermos usar as informações de tempo 

#O Rake é uma ferramenta muito usada em projetos ruby rails, ele é usado para 
#gerenciar tarefas.

#Aqui foi criado uma tarefa usando a sintaxe do Rake, nesse caso tambem foi 
#o recurso da biblioteca "time" do ruby que nos possibilita ter acesso a data
#e hora. Com isso podemos formar os nomes dos arquivos de log de forma que tere-
#mos o nome do report com data e hora para podermos ter um melhor controle das 
#versões de teste. Foi usado o recurso de shell script com o comando "sh" para
#que fosse possível concatenar com o nome do cucumber no formato de linha de co-
#mando. É passado como argumento as "tags" que seriam as marcações de quais step
#serão executadas, dessa forma fica mais dinâmico o código.Temos a informação do
#"browser", que indicará qual navegador eu quero usar para executar os steps.
task :specs, [:tags,:browser] do |task, args|
    time =  Time.now.utc.iso8601.tr(":", "")
    report = "--format html --out=log/report_#{time}.html"
    sh "cucumber #{args[:tags]} #{report} #{args[:browser]}"
end