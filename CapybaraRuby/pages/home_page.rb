require '../pages/common_page'

# This page is used for defining interfaces and actions on Home page
class HomePage < CommonPage
  set_url TCConfig::TC_URL

  def navigate_testcentral
    load
    page.driver.browser.manage.window.maximize
  end

  element :lnk_signin, '.dropdown-menu>li>a[href*="signin"]'
  element :lnk_users, :xpath, "//a[contains(text(),'Users')]"
end
