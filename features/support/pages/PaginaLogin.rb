class PaginaLogin

  include RSpec::Matchers
  include Capybara::DSL

  def realiza_login_sucesso(tipo_login)
    assert_selector(EL['usuario'], wait: 15)
    find(EL['usuario']).set(DATA["user_#{tipo_login}"])
    find(EL['senha']).set(DATA["password_#{tipo_login}"])
    PaginaComum.new.clica_elemento("botao_entrar")
  end
  
end
