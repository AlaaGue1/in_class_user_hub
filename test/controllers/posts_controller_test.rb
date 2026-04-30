require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get posts_delete_url
    assert_response :success
  end
end
