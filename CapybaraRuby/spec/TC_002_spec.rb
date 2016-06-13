require '../pages/home_page'
require '../pages/login_page'

describe 'user menu sub-links link to right page' do
  home_page = HomePage.new
  login_page = LoginPage.new

  context 'User menu sub-links link to right page' do
    it 'should login successfully' do
      home_page.navigate_testcentral
      home_page.navigate_menu_bar('Users>sign in')
      login_page.login(TCConfig::TC_EMAIL, TCConfig::TC_PASSWORD)
      expect(home_page.page_title).to eq('Test Central')
    end

    it 'each sublink should navigate to right page' do
      TCData::TC2_SUBLINK_PAGE.each do |sublink, page|
        expect(login_page.get_sublink_page(login_page.get_username(TCConfig::TC_EMAIL), sublink)).to eq(page)
      end
    end
  end
end
