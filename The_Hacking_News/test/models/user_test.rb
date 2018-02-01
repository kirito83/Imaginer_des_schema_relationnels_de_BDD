require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(pseudonyme: "Pseudonyme", address: "23 champ du repos - 75000 - Paris", first_name: "ExampleFirstName", last_name: "ExampleLastName", email: "example@email.com", password: "passwordexample", password_confirmation: "passwordexample")
  end

  test "should be valid" do 
    assert @user.valid?
  end

  test "pseudo should be present" do 
  	@user.pseudonyme = "     "
  	assert_not @user.valid?
  end

  test "address should be present" do 
    @user.address = "   "
    assert_not @user.valid?
  end

  test "first name should be present" do 
  	@user.first_name = "     "
  	assert_not @user.valid?
  end

  test "last name should be present" do 
  	@user.last_name = "     "
  	assert_not @user.valid?
  end

  test "email should be present" do 
  	@user.email = "     "
  	assert_not @user.valid?
  end

  test "password should be present" do 
    @user.password = @user.password_confirmation = "      "
    assert_not @user.valid?
  end

  test "pseudo should not be too long" do
    @user.pseudonyme = "a" * 13 
    assert_not @user.valid?
  end

    test "pseudo should not be too short" do
    @user.pseudonyme = "a" * 1 
    assert_not @user.valid?
  end

  test "first name should not be too long" do
    @user.first_name = "a" * 51 
    assert_not @user.valid?
  end

  test "first name should not be too short" do
    @user.first_name = "a" * 1
    assert_not @user.valid?
  end

  test "last name should not be too long" do
    @user.last_name = "a" * 51 
    assert_not @user.valid?
  end

  test "last name should not be too short" do
    @user.last_name = "a" * 1
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "password should not be too long" do 
    @user.password = @user.password_confirmation = "a" * 51
    assert_not @user.valid?
  end

  test "password should have a minimum length" do 
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "pseudo & email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[student@example.com STUDENT@foo.COM S_T-ENT@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[student@example,com student_at_foo.org student.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
