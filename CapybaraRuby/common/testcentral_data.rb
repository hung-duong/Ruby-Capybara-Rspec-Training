# This class is used for defining data for using in test cases
class TCData
  TC1_USER_SUBLINKS = ['add/edit user', 'audit log', 'config', 'email rollups', 'station settings', 'help', 'sign out']
  TC2_SUBLINK_PAGE = { 'add/edit user' => 'Test Central | Create User',
                       'audit log' => 'Test Central | Audit Log',
                       'config' => 'Test Central | Test Central Configuration',
                       'email rollups' => 'Test Central | Email Rollups',
                       'station settings' => 'Test Central | Station Settings',
                       'help' => 'Test Central | Help',
                       'sign out' => 'Test Central | Login' }

  TC3_ENV = 'QA'
  TC3_PLATFORM = 'FRV3 - French Canada Virtual codes for French App Center'
  TC3_FILEPATH_INCORRECT = '../data/redeemfile.pdf'
  TC3_FILEPATH_CORRECT = '../data/frv3.csv'
  TC3_CODE_TYPE = 'FRV3'
  TC3_MSG_CORRECT = 'PINs are uploaded successfully.'
  TC3_MSG_INCORRECT = 'Error while uploading Code file. Please try again!'
end
