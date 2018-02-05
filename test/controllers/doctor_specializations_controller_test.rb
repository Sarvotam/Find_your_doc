require 'test_helper'

class DoctorSpecializationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor_specialization = doctor_specializations(:one)
  end

  test "should get index" do
    get doctor_specializations_url
    assert_response :success
  end

  test "should get new" do
    get new_doctor_specialization_url
    assert_response :success
  end

  test "should create doctor_specialization" do
    assert_difference('DoctorSpecialization.count') do
      post doctor_specializations_url, params: { doctor_specialization: { name: @doctor_specialization.name } }
    end

    assert_redirected_to doctor_specialization_url(DoctorSpecialization.last)
  end

  test "should show doctor_specialization" do
    get doctor_specialization_url(@doctor_specialization)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctor_specialization_url(@doctor_specialization)
    assert_response :success
  end

  test "should update doctor_specialization" do
    patch doctor_specialization_url(@doctor_specialization), params: { doctor_specialization: { name: @doctor_specialization.name } }
    assert_redirected_to doctor_specialization_url(@doctor_specialization)
  end

  test "should destroy doctor_specialization" do
    assert_difference('DoctorSpecialization.count', -1) do
      delete doctor_specialization_url(@doctor_specialization)
    end

    assert_redirected_to doctor_specializations_url
  end
end
