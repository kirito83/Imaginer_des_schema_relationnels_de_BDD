require 'test_helper'

class UnderCommentTest < ActiveSupport::TestCase
  
  def setup
    @undercomment = UnderComment.new(body: "Body Example........")
  end

  test "should be present" do 
    @undercomment.body = "     "
    assert_not @undercomment.valid?
  end
end
