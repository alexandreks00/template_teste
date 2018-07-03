class PaginaComum

  include RSpec::Matchers
  include Capybara::DSL

  def adicionar_carrinho
    expect(page).to have_css("#cc-prodDetailsAddToCart")
    execute_script("window.scrollTo(0,500);")
    find('span', text: "Adicionar ao carrinho", wait: 15, visible:true).hover

    begin 
      retries ||= 0
      find('span', text: "Adicionar ao carrinho", wait: 15, visible:true).click
    rescue
      execute_script("window.scrollTo(0,400);")
      execute_script("window.scrollTo(0,600);")
      retry if (retries += 1) < 3
    end

  end

  def foco_browser
    result = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(result)
  end
  
end
