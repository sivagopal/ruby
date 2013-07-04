require 'test_helper'
require 'user'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
     @user = User.new
     @user.email = "test@test.com"
     @user.firstName="test"
     @user.lastName="test"
     @user.mobile="000-000-000"
     assert is_valid_name?(@user.firstName)
     assert is_valid_name?(@user.lastName)
     assert is_a_valid_email?( @user.email)
     assert is_valid_mobile?(@user.mobile)
     @user.firstName=""
     @user.email = "test"
     @user.mobile="XXX-XXX-000"
     assert !is_valid_name?(@user.firstName)
     assert !is_a_valid_email?(@user.email)
     assert !is_a_valid_email?("test@test")

     assert !is_valid_mobile?(@user.mobile)
  end

  def is_valid_name?(name)
    if (name.length > 0 && name.length <=20)  then
      return true
    else
      return false
    end
  end
  def is_a_valid_email?(email)
    # Check the number of '@' signs.
    if email.count("@") != 1 then
      return false

      # We can now check the email using a simple regex.
      # You can replace the TLD's at the end with the TLD's you wish
      # to accept.
    elsif email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i then
      return true
    else
      return false
    end
  end
  def is_valid_mobile?(mobile)
    # Check the number of '@' signs.
    if mobile.length< 11 then
      return false

      # We can now check the email using a simple regex.
      # You can replace the TLD's at the end with the TLD's you wish
      # to accept.
    elsif mobile =~ /\A[0-9]{3}-[0-9]{3}-[0-9]{3}\Z/ then
      return true
    else
      return false
    end
  end

end
