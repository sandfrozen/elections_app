require 'test_helper'

class ElectionUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election_user = election_users(:one)
  end

  test "should get index" do
    get election_users_url
    assert_response :success
  end

  test "should get new" do
    get new_election_user_url
    assert_response :success
  end

  test "should create election_user" do
    assert_difference('ElectionUser.count') do
      post election_users_url, params: { election_user: { Election_id: @election_user.Election_id, User_id: @election_user.User_id, vote: @election_user.vote } }
    end

    assert_redirected_to election_user_url(ElectionUser.last)
  end

  test "should show election_user" do
    get election_user_url(@election_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_election_user_url(@election_user)
    assert_response :success
  end

  test "should update election_user" do
    patch election_user_url(@election_user), params: { election_user: { Election_id: @election_user.Election_id, User_id: @election_user.User_id, vote: @election_user.vote } }
    assert_redirected_to election_user_url(@election_user)
  end

  test "should destroy election_user" do
    assert_difference('ElectionUser.count', -1) do
      delete election_user_url(@election_user)
    end

    assert_redirected_to election_users_url
  end
end
