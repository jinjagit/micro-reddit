require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = posts(:one)
    @comment = Comment.new(body: "Test comment body text", user_id: @user.id, post_id: @post.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user_id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "post_id should be present" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "body should be present" do
    @comment.body = "     "
    assert_not @comment.valid?
  end

  test "body should not be too long" do
    @comment.body = "a" * 2001
    assert_not @comment.valid?
  end
end
