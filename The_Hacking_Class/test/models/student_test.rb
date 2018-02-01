require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  def setup
    @student = Student.new(pseudonyme: "Pseudonyme", first_name: "ExampleFirstName", last_name: "ExampleLastName", email: "example@email.com", password: "passwordexample", password_confirmation: "passwordexample")
  end

  test "pseudo should be present" do 
  	@student.pseudonyme = "     "
  	assert_not @student.valid?
  end

  test "first name should be present" do 
  	@student.first_name = "     "
  	assert_not @student.valid?
  end

  test "last name should be present" do 
  	@student.last_name = "     "
  	assert_not @student.valid?
  end

  test "email should be present" do 
  	@student.email = "     "
  	assert_not @student.valid?
  end

  test "password should be present" do 
    @student.password = @student.password_confirmation = " " * 6
    assert_not @student.valid?
  end

  test "pseudo should not be too long" do
    @student.pseudonyme = "a" * 12 
    assert_not @student.valid?
  end

  test "pseudo should not be too short" do
    @student.pseudonyme = "a" * 4 
    assert_not @student.valid?
  end

  test "first name should not be too long" do
    @student.first_name = "a" * 50 
    assert_not @student.valid?
  end

  test "first name should not be too short" do
    @student.first_name = "a" * 2 
    assert_not @student.valid?
  end

  test "last name should not be too long" do
    @student.last_name = "a" * 50 
    assert_not @student.valid?
  end

  test "last name should not be too short" do
    @student.last_name = "a" * 2 
    assert_not @student.valid?
  end

  test "email should not be too long" do
    @student.email = "a" * 244 + "@example.com"
    assert_not @student.valid?
  end

  test "password should not be too short" do 
    @student.password = @student.password_confirmation = "a" * 8
    assert_not @student.valid?
  end

  test "password should not be too long" do
    @student.password = @student.password_confirmation = "a" * 50
    assert_not @student.valid?
  end

  test "pseudo & email addresses should be unique" do
    duplicate_student = @student.dup
    @student.save
    assert_not duplicate_student.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[student@example.com STUDENT@foo.COM S_T-ENT@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @student.email = valid_address
      assert true, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[student@example,com student_at_foo.org student.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @student.email = invalid_address
      assert_not @student.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end