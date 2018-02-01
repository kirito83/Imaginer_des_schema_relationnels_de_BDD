require 'test_helper'

class CourTest < ActiveSupport::TestCase
  def setup
    @cour = Cour.new(title: "Example Title")
  end

  test "should be valid" do 
    assert @cour.valid?
  end

  test "title should be present" do 
    @cour.title = "        "
    assert_not @cour.valid?
  end
  
end
