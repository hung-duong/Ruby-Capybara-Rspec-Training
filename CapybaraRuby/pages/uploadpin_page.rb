require '../pages/common_page'

# This page is used for defining interfaces and actions on Upload Pin page
class UploadPinPage < CommonPage
  def select_environment(env)
    find(:xpath, "//span[text() = '#{env}']").click
  end

  def enter_filepath(filepath)
    filepath = File.absolute_path(filepath)
    page.execute_script("$('input.form-control').val('#{filepath}')")
    filepath = get_file_path(filepath)
    script = "$('.btn-file').attr('class', 'btn btn-default')"
    page.execute_script(script)
    txt_filepath_hidden.set(filepath)
  end

  def upload_redeem_code(env, platform, filepath)
    select_environment(env)
    select_dropdownlist_item(cbo_platform, platform)
    enter_filepath(filepath)
    btn_upload.click
  end

  def get_file_path(filepath)
    filepath.sub!('/', '\\') while filepath.include? '/'
    filepath
  end

  def upload_message
    lbl_alert.text
  end

  def pin_value(type, env)
    if env == 'QA'
      col_index = 2
    elsif env == 'PROD'
      col_index = 3
    end
    find(:xpath, "//table[@class = 'table available_pins']/..//td[contains(text(),'#{type}')]/../td[#{col_index}]").text
  end

  element :cbo_platform, '#file_name'
  element :btn_upload, '.js-validate-uploaded-pin'
  element :btn_browser, :xpath, "//span[contains(text(), 'Browse')]"
  element :txt_filepath, 'input.form-control'
  element :txt_filepath_hidden, '#code_file'
  element :lbl_alert, '.alert'
  element :tbl_pin, '.table-responsive'
end
