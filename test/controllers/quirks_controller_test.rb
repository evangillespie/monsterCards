require 'test_helper'

class QuirksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quirks_index_url
    assert_response :success
  end

end
