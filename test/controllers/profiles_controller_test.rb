require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "should get new" do
    get profiles_new_url
    assert_response :success
  end

>>>>>>> master
end
