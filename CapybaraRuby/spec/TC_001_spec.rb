require '../pages/home_page'
require '../pages/login_page'

describe 'TestCentral Functions' do
  home_page = HomePage.new
  login_page = LoginPage.new

  context 'Customer Lookup Checking' do
    it 'should login to Test Central successfully' do
      home_page.navigate_testcentral
      home_page.navigate_menu_bar('Users>sign in')
      login_page.login(TCConfig::TC_EMAIL, TCConfig::TC_PASSWORD)
      expect(home_page.page_title).to eq('Test Central')
    end

    it 'sublinks should display correctly' do
      expect(login_page.does_submenu_items_exist_in_order(login_page.get_username(TCConfig::TC_EMAIL),
                                                          TCData::TC1_USER_SUBLINKS)).to eq(true)
    end

    it 'should log out successfully' do
      login_page.logout(login_page.get_username(TCConfig::TC_EMAIL))
      expect(login_page.page_title).to eq('Test Central | Login')
    end
  end
end
