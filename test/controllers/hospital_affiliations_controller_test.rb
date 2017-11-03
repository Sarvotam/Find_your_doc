require 'test_helper'

class HospitalAffiliationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital_affiliation = hospital_affiliations(:one)
  end

  test "should get index" do
    get hospital_affiliations_url
    assert_response :success
  end

  test "should get new" do
    get new_hospital_affiliation_url
    assert_response :success
  end

  test "should create hospital_affiliation" do
    assert_difference('HospitalAffiliation.count') do
      post hospital_affiliations_url, params: { hospital_affiliation: {  } }
    end

    assert_redirected_to hospital_affiliation_url(HospitalAffiliation.last)
  end

  test "should show hospital_affiliation" do
    get hospital_affiliation_url(@hospital_affiliation)
    assert_response :success
  end

  test "should get edit" do
    get edit_hospital_affiliation_url(@hospital_affiliation)
    assert_response :success
  end

  test "should update hospital_affiliation" do
    patch hospital_affiliation_url(@hospital_affiliation), params: { hospital_affiliation: {  } }
    assert_redirected_to hospital_affiliation_url(@hospital_affiliation)
  end

  test "should destroy hospital_affiliation" do
    assert_difference('HospitalAffiliation.count', -1) do
      delete hospital_affiliation_url(@hospital_affiliation)
    end

    assert_redirected_to hospital_affiliations_url
  end
end
