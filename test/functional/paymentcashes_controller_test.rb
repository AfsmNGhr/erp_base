require 'test_helper'

class PaymentcashesControllerTest < ActionController::TestCase
  setup do
    @paymentcash = paymentcashes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paymentcashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paymentcash" do
    assert_difference('Paymentcash.count') do
      post :create, paymentcash: { how_many: @paymentcash.how_many, staff_id: @paymentcash.staff_id, when: @paymentcash.when }
    end

    assert_redirected_to paymentcash_path(assigns(:paymentcash))
  end

  test "should show paymentcash" do
    get :show, id: @paymentcash
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paymentcash
    assert_response :success
  end

  test "should update paymentcash" do
    put :update, id: @paymentcash, paymentcash: { how_many: @paymentcash.how_many, staff_id: @paymentcash.staff_id, when: @paymentcash.when }
    assert_redirected_to paymentcash_path(assigns(:paymentcash))
  end

  test "should destroy paymentcash" do
    assert_difference('Paymentcash.count', -1) do
      delete :destroy, id: @paymentcash
    end

    assert_redirected_to paymentcashes_path
  end
end
