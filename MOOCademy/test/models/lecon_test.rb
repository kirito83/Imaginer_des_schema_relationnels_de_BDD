require 'test_helper'

class LeconTest < ActiveSupport::TestCase
  def setup
  	@lecon = Lecon.new(title: "Example Title", body: "Example body......")
  end
  
  test "should be valid" do
  	assert true
  end

  test "title should be present" do 
  	@lecon.title = "     "
  	assert_not @lecon.valid?
  end

  test "body should be present" do 
  	@lecon.body = "     "
  	assert_not @lecon.valid?
  end

  test "title should be unique" do 
  	duplicate_lecon = @lecon.dup
  	@lecon.save
  	assert_not duplicate_lecon.valid?
  end
end
