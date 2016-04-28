require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'Thruster', email: 'jimmy@jimmy.com')
  end

  test "user should be valid" do
    assert @user.valid?  
  end
end
