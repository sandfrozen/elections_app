require 'test_helper'

class ElectionCandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election_candidate = election_candidates(:one)
  end

  test "should get index" do
    get election_candidates_url
    assert_response :success
  end

  test "should get new" do
    get new_election_candidate_url
    assert_response :success
  end

  test "should create election_candidate" do
    assert_difference('ElectionCandidate.count') do
      post election_candidates_url, params: { election_candidate: { Election_id: @election_candidate.Election_id, User_id: @election_candidate.User_id, list: @election_candidate.list, party: @election_candidate.party, place: @election_candidate.place } }
    end

    assert_redirected_to election_candidate_url(ElectionCandidate.last)
  end

  test "should show election_candidate" do
    get election_candidate_url(@election_candidate)
    assert_response :success
  end

  test "should get edit" do
    get edit_election_candidate_url(@election_candidate)
    assert_response :success
  end

  test "should update election_candidate" do
    patch election_candidate_url(@election_candidate), params: { election_candidate: { Election_id: @election_candidate.Election_id, User_id: @election_candidate.User_id, list: @election_candidate.list, party: @election_candidate.party, place: @election_candidate.place } }
    assert_redirected_to election_candidate_url(@election_candidate)
  end

  test "should destroy election_candidate" do
    assert_difference('ElectionCandidate.count', -1) do
      delete election_candidate_url(@election_candidate)
    end

    assert_redirected_to election_candidates_url
  end
end
