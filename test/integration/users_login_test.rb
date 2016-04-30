require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jimmy)
  end
  
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?, 'Flash did not clear'
  end

  test "login with valid information" do 
    get login_path 
    assert_template 'sessions/new'
    post login_path, session: {username: @user.username, password: 'password'}
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 2
    assert_select "a[href=?]", logout_path
  end
end
