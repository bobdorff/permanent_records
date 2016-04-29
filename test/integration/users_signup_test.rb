require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test 'invalid signup does not save' do
    assert_no_difference 'User.count' do 
      post users_path, user: {  username: "",
                              email: "invalid.in",
                              password: "in",
                              password_confirmation: 'valid'}
    end
    assert_template 'users/new'
  end

  test 'valid signup does save' do 
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {  username: "ciablo",
                              email: "valid@good.com",
                              password: "password",
                              password_confirmation: 'password'}
    end
  assert_template 'users/show'
  assert_select '.alert-success'
  end
end
