require 'test_helper'

class CourTest < ActiveSupport::TestCase
  
  def setup
  	@cour = Cour.new(title: "Example Title", description: "Example Description......")
  end
  
  test "should be valid" do
  	assert @cour.valid?
  end

  test "title should be present" do 
  	@cour.title = "     "
  	assert_not @cour.valid?
  end

  test "description should be present" do 
  	@cour.description = "     "
  	assert_not @cour.valid?
  end

  test "title should be unique" do 
  	duplicate_cour = @cour.dup
  	@cour.save
  	assert_not duplicate_cour.valid?
  end
end
