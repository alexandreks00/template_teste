#language: pt
#cenario: 12
#Exemplo ilustrativo!
Funcionalidade: Nome da funcionalidade, seja objetivo!


Contexto:
  Dado que eu visualizo a pagina principal
  E realizo a busca por um produto "auto_complete"
  E espero ver pagina do sku
   
@auto_complete_carrinho 
Cenario: Buscando um produto pelo auto-complete, adicionando ao carrinho 
  Quando adiciono o produto no carrinho pela pdp
  Entao espero chegar na checkout 


