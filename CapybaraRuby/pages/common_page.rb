require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require '../common/testcentral_config'
require '../common/testcentral_data'

# This page is used for defining common actions for using on other pages
class CommonPage < SitePrism::Page
  Capybara.current_driver = :selenium

  def logout(user)
    navigate_menu_bar(user)
    lnk_signout.click
  end

  def page_title
    page.title
  end

  def does_submenu_items_exist_in_order(mainmenu, list_subitems)
    navigate_menu_bar(mainmenu)
    list_links = page.all('li ul li a').map { |link| link['text'] }
    list_links == list_subitems
  end

  def get_username(email)
    values = email.split('@')
    values[0]
  end

  def get_sublink_page(mainmenu, sublink)
    navigate_menu_bar("#{mainmenu}>#{sublink}")
    page_title
  end

  def navigate_menu_bar(menupath)
    while menupath.include? '>'
      submenu = menupath[0, menupath.index('>')]
      find(:xpath, "//li/a[contains(text(),'#{submenu}')]").click
      menupath = menupath[menupath.index('>') + 1, menupath.length]
    end
    find(:xpath, "//a[contains(text(),'#{menupath}')]").click
  end

  def select_dropdownlist_item(dropdownlist, item)
    dropdownlist.select(item)
  end

  element :lnk_signout, '.dropdown-menu>li>a[href*="signout"]'
end
