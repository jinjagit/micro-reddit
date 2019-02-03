require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:jinja)
    @post = Post.new(title: "Test Post Title", body: "Test post body text.", user_id: @user.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user_id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = "     "
    assert_not @post.valid?
  end

  test "title should not be too long" do
    @post.title = "a" * 51
    assert_not @post.valid?
  end

  test "body should not be too long" do
    @post.body = "a" * 2001
    assert_not @post.valid?
  end
end
