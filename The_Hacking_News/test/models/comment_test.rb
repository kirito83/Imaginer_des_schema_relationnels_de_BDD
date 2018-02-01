require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment = Comment.new(body: "Body Example.......")
  end

  test "should be present" do 
    @comment.body = "      "
    assert_not @comment.valid?
  end
  
end
