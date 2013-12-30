require 'test_helper'

class MemberProfilesControllerTest < ActionController::TestCase
  setup do
    @member_profile = member_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_profile" do
    assert_difference('MemberProfile.count') do
      post :create, member_profile: { name: @member_profile.name }
    end

    assert_redirected_to member_profile_path(assigns(:member_profile))
  end

  test "should show member_profile" do
    get :show, id: @member_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_profile
    assert_response :success
  end

  test "should update member_profile" do
    patch :update, id: @member_profile, member_profile: { name: @member_profile.name }
    assert_redirected_to member_profile_path(assigns(:member_profile))
  end

  test "should destroy member_profile" do
    assert_difference('MemberProfile.count', -1) do
      delete :destroy, id: @member_profile
    end

    assert_redirected_to member_profiles_path
  end
end
