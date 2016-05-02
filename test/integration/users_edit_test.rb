require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:jimmy)
  end

  test "unsuccessful edit attempt" do 
    log_in_as(@user)
    assert is_logged_in?
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { username: "", 
                                    email: "foo@invalid",
                                    password: "foo",
                                    password_confirmation: "bar" 
                                  }
    assert_template "users/edit"
  end

  test "successful edit attempt/kind forwarding" do 
    get edit_user_path(@user)
    log_in_as(@user)
    assert is_logged_in?
    assert_redirected_to edit_user_path(@user)
    patch user_path(@user), user: { username: 'davey',
                                    email: 'valid@gmail.com',
                                    password: "",
                                    password_confirmation: "" 
                                  }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.username, 'davey'
    assert_equal @user.email, 'valid@gmail.com' 
  end
end

