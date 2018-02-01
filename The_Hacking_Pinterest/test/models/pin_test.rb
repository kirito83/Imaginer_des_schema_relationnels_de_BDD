require 'test_helper'

class PinTest < ActiveSupport::TestCase

  def setup
    @pin = Pin.new(img_link: "http://img_link.example.com")
  end

  test "link should be present" do 
  	@pin.img_link = "     "
  	assert_not @pin.valid?
  end
end
