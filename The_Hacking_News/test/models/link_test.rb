require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  
  def setup
    @link = Link.new(submitted_link: "http://lelien.poste.com")
  end

  test "pseudo should be present" do 
  	@link.submitted_link = "     "
  	assert_not @link.valid?
  end
  
end
