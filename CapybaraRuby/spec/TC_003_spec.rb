require '../pages/home_page'
require '../pages/login_page'
require '../pages/uploadpin_page'

describe 'TestCentral Functions' do
  home_page = HomePage.new
  login_page = LoginPage.new
  uploadpin_page = UploadPinPage.new

  context 'Login Test Central' do
    it 'should login successfully' do
      home_page.navigate_testcentral
      home_page.navigate_menu_bar('Users>sign in')
      login_page.login(TCConfig::TC_EMAIL, TCConfig::TC_PASSWORD)
    end
  end

  context 'Upload redeem code with incorrect format' do
    it 'navigate to upload PIN page successfully' do
      login_page.navigate_menu_bar('ATG>upload PIN')
      expect(uploadpin_page.page_title).to eq('Test Central | Upload Redeem Code')
    end

    it 'upload code unsuccessfully' do
      uploadpin_page.upload_redeem_code(TCData::TC3_ENV,
                                        TCData::TC3_PLATFORM, TCData::TC3_FILEPATH_INCORRECT)
      expect(uploadpin_page.upload_message).to eq(TCData::TC3_MSG_INCORRECT)
    end
  end

  context 'Upload redeem code with correct format' do
    it 'navigate to upload PIN page successfully' do
      login_page.navigate_menu_bar('ATG>upload PIN')
    end

    it 'upload code successfully' do
      uploadpin_page.upload_redeem_code(TCData::TC3_ENV,
                                        TCData::TC3_PLATFORM, TCData::TC3_FILEPATH_CORRECT)
      expect(uploadpin_page.upload_message).to eq(TCData::TC3_MSG_CORRECT)
    end

    it 'QA value equals to 40' do
      expect(uploadpin_page.pin_value(TCData::TC3_CODE_TYPE,
                                      TCData::TC3_ENV)).to eq('40')
    end
  end

  context 'Logout Test Central' do
    it 'should log out successfully' do
      login_page.logout(login_page.get_username(TCConfig::TC_EMAIL))
    end
  end
end
