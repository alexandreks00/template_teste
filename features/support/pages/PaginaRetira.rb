class PaginaRetira

  include RSpec::Matchers
  include Capybara::DSL

  def seleciona_loja_retira_lockers
    assert_selector(eval($EL)['botao_retirar_nesta_loja'], text: "Retirar neste local", wait: 25)
    x = all(eval($EL)['botao_retirar_nesta_loja'], text: "Retirar neste local").length
    i = 0
    y = []
    lockers = "Locker"
    correio = "AC"

    while i < x do
      y = all("h3[class='strong']")[i].text
      if y.include?(lockers) || y.include?(correio)
        end_retira = y
        puts "Loja eleita: #{y}"
        puts "Posicao: #{i}"
        break
      end
      i  = i+1
    end
    PaginaComum.new.clica_elemento_texto("botao_retirar_nesta_loja", "Retirar neste local", i)

    return end_retira
  end

end


