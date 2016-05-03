require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user     = users(:jimmy)
    @user_two = users(:kendrick)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do 
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do 
    patch :update, id: @user, user: {username: @user.username, email: @user.email}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirects edit if a user tries to access a different user's edit page" do 
    log_in_as(@user_two)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "redirects update if a user submits edits for someone else" do 
    log_in_as(@user_two)
    patch :update, id: @user, user: { name: @user.username, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "users are redirected if they try to access index and are not logged in" do 
    get :index
    assert_redirected_to login_url
  end

  test "should redirect destroy if user is not logged in" do 
    log_in_as(@user_two)
    assert_no_difference "User.count" do 
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test "should delete the user if user initiates delete" do 
    log_in_as(@user_two)
    assert_difference "User.count", -1 do 
      delete :destroy, id: @user_two
    end
    assert_redirected_to root_url    
  end
end
