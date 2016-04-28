require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'Thruster', email: 'jimmy@jimmy.com')
  end

  test "user should be valid" do
    assert @user.valid?  
  end

  test "user must have username" do
    @user.username = "    "
    assert_not @user.valid?, "User without username is valid"
  end

  test "user must have email" do 
    @user.email = "    "
    assert_not @user.valid?, "User without email is valid"
  end

  test "username must be less than 26 characters" do 
    @user.username = "a" * 26
    assert_not @user.valid?, "User with 26 character name is valid"
  end

  test "email must be less than 200 characters" do 
    @user.email = "a" * 201
    assert_not @user.valid?, "User with 201 character name is valid"
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do 
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
