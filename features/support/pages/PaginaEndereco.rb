class PaginaEndereco

  include RSpec::Matchers
  include Capybara::DSL

  def cria_endereco_sucesso
    #Preenchimento do form de cadastro
    assert_selector(EL['tipo_endereco'], wait: 15)
    find(EL['tipo_endereco']).find("option", text: "Outro").click
    find(EL['identificacao']).set("casa #{rand(1..9)}")
    find(EL['nome_destinatario']).set("Raffaelle Luisi")
    find(EL['cep_cadastro'], wait: 30, visible: 30).set("09510130")
    PaginaComum.new.clica_elemento("botao_salvar")
  end
end