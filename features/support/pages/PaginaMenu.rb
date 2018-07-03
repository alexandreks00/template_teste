class PaginaMenu

  include RSpec::Matchers
  include Capybara::DSL

  def current_url
    driver.current_url
  end

end
