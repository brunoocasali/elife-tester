class LoginPage
  include Capybara::DSL

  def visit_page
    visit '/user/session/new'
  end

  # I don't need have the Open/Closed principle here, because it's a simple test, and I' havent configured 
  # any kind of creator fake objects
  def login
  	visit_page

    fill_in 'username', with: 'fabio+debug@elife.com.br'
    fill_in 'password', with: 'devElife'

    click_button 'Login'
  end
end