require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup 
    @user = users(:jimmy)
  end

  test "users index displays a list of all users" do 
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'a[href=?]', user_path(@user) 
  end 
end
