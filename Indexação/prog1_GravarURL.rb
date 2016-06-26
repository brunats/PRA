#           Bruna Tavares Silva            #
#           Gabriel Guebarra Conejo        #



# Ao colocar ao site leve em consideração que "http://" & "https://" importam, e se um site for https mas digitar http dará erro
# É necessário que o site tenha www também

#             EXEMPLOS DE ENTRADA DAS URLs
#      1:     https://www.eventbrite.com.br
#      2:     http://www.sympla.com.br

# Se a palvra pesquisada for parte do código html, leve em mente que palavra é tudo aquilo que não está separado por um espaço ou aspas 
# ou coisas do tipo.

# O diretório pagBaixadas não é criado pelo programa e deve existir no mesmo diretório do arquivo .rb
# O diretório pagBaixadas éstá disponível no github e está vazio.

require "open-uri"
require 'ferret'
require 'uri'

include Ferret



#cria/abre índice
index = Index::Index.new(:path => 'pagBaixadas')  


#Pega url, ajeita a url para não dar erro com caracteres especiais, seta variáveis para nome do arquivo
puts 'Digite o site a ser indexado'
url1 = gets
parsed = URI.parse(URI.encode(url1.strip))
site1 = url1.sub("http://www.","")
site1 = site1.sub("https://www.","")
site1 = site1.sub("/","")
site1.chomp!
time1 = Time.now

# printa na tela para debug
puts url1
puts site1
puts parsed

#criando nome para o arquivo
pal = "page#{site1}-#{time1.day}-#{time1.month}-#{time1.year}-#{time1.hour}-#{time1.min}-#{time1.sec}"
puts pal

#Lê site e cria arquivo
remote_data = open(parsed, &:read)
my_local_file = open("pagBaixadas/#{pal}.txt", "w") 

#escreve html do site no arquivo
my_local_file.write(remote_data)
my_local_file.close

#Gravando o índice
index << {  
	:title => pal,  
	:content => remote_data  
}  
