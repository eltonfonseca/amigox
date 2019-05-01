require 'test_helper'

class RaffleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get raffle_index_url
    assert_response :success
  end

end
