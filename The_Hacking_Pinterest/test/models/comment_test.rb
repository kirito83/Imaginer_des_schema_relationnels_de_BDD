require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
  	@comment = Comment.new(body: "Example of body")
  end

  test "body should be present" do 
  	@comment.body = "     "
  	assert_not @comment.valid?
  end

end
