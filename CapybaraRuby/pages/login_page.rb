require '../pages/common_page'

# This page is used for defining interfaces and actions on Login page
class LoginPage < CommonPage
  def login(email, password)
    txt_email.set(email)
    txt_password.set(password)
    btn_login.click
  end

  element :txt_email, '#user_email'
  element :txt_password, '#user_password'
  element :btn_login, '.btn.btn-success[value="Log In"]'
end
