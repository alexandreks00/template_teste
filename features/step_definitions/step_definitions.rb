Quando(/^seleciono o produto desejado, seleciono tipo de garantia "([^"]*)"$/) do |tipo_garantia|
  @resultados.seleciona_produto(0)
  @resultados.cancela_negociacao
  @comum.clica_elemento("botao_comprar")
  @pagamento.seleciona_garantia(tipo_garantia)
  assert_selector(eval($EL)['subtotal'], wait: 30, visible:true)
  @preco = first('span[class="prod-item-price cart--prod-item-price pull-right bold"]').text
  @preco = @preco.delete!(' ')
  puts "Valor da compra: #{@preco}"
  @comum.clica_elemento("botao_finalizar")
end

##Exemplo