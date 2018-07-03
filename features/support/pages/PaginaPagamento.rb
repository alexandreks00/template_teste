class PaginaPagamento

  include RSpec::Matchers
  include Capybara::DSL

  def preenche_redepay_finaliza
    assert_selector("img[src='https://img.useredepay.com.br/buttons/cen1_hor_op3_pc_225x45.png']", wait:30, visible:true)
    assert_selector("img[src='https://img.useredepay.com.br/buttons/cen1_hor_op3_pc_225x45.png']", wait: 20)
    find("img[src='https://img.useredepay.com.br/buttons/cen1_hor_op3_pc_225x45.png']").click
  end

  def preenche_cartao_credito
    assert_selector("#number", wait: 15, visible:true)
    cartoes = "4111111111111111"
    find(EL['cartao'], wait: 10).set(cartoes)
    find(EL['nome_titular'], wait: 10).set("Automacao QA")
    find(EL['validade'], wait: 10).set("122022")
    find(EL['codigo_seguranca'], wait: 10).set("547")
    expect(page).to have_css("select#installments")
    select("em 2x", from: EL['parcela'])
  end

  def preenche_dois_cartoes_credito_nao_finaliza
    assert_text("Pagar com", wait:15)
    all('.lst-item-cell.lst-item-cell-expanded')[1].click
    preenche_cartao_credito
    PaginaComum.new.clica_elemento("botao_continuar_dois_cartoes")
    preenche_cartao_credito
  end

  def preenche_cartao_boleto_finaliza
    begin
      retries ||= 0
      assert_text("Pagar com", wait:5)
      #Opção boleto cartao abaixo:
      all('.lst-item-cell.lst-item-cell-expanded', wait: 5)[2].click
      assert_text('Adicione o valor a ser pago no Boleto', wait: 5)
      #binding.pry
      #Lembrando que a regra do valor minimo do boleto é de 50 conto
      first(EL['campo_valor_boleto_checkout'], wait: 10, visible: true).set('5100')
      first(EL['botao_avançar_boleto'], wait: 10).click
      find('#CreditCard', wait: 10, visible: true).value
      preenche_cartao_credito
      within('*[class="container-term-description"]', text: "Forma de pagamento") do
        forma_pagamento =  find('h6').text
        p "Forma de pagamento #{forma_pagamento}"
        p find('p').text
      end
      first(EL['botao_finalizar_compra'], wait: 5).hover
      first(EL['botao_finalizar_compra'], wait: 5).click
    rescue
      retry if (retries += 1) < 3  
    end
  end

  
###FIM
end
