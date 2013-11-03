require 'test_helper'

class StaffobjectjournalsControllerTest < ActionController::TestCase
  setup do
    @staffobjectjournal = staffobjectjournals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:staffobjectjournals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create staffobjectjournal" do
    assert_difference('Staffobjectjournal.count') do
      post :create, staffobjectjournal: { edate: @staffobjectjournal.edate, sdate: @staffobjectjournal.sdate, staff_id: @staffobjectjournal.staff_id, workobject_id: @staffobjectjournal.workobject_id }
    end

    assert_redirected_to staffobjectjournal_path(assigns(:staffobjectjournal))
  end

  test "should show staffobjectjournal" do
    get :show, id: @staffobjectjournal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @staffobjectjournal
    assert_response :success
  end

  test "should update staffobjectjournal" do
    put :update, id: @staffobjectjournal, staffobjectjournal: { edate: @staffobjectjournal.edate, sdate: @staffobjectjournal.sdate, staff_id: @staffobjectjournal.staff_id, workobject_id: @staffobjectjournal.workobject_id }
    assert_redirected_to staffobjectjournal_path(assigns(:staffobjectjournal))
  end

  test "should destroy staffobjectjournal" do
    assert_difference('Staffobjectjournal.count', -1) do
      delete :destroy, id: @staffobjectjournal
    end

    assert_redirected_to staffobjectjournals_path
  end
end
