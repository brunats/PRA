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

require 'ferret'

include Ferret


# get or create an index on the filesystem  
index = Index::Index.new(:path => 'pagBaixadas', :create =>false)  

#pegando palavra para indexar
puts 'Digite a palvra que deve ser procurada (uma palavra apenas):'
palavra = gets

#mostrar arquivos que contém a palavra
puts 'Os aqruivos que contem a palavra são:'
index.search_each(palavra) do | id, score |  
	puts "TITLE: #{index[id][:title]}"  
end  