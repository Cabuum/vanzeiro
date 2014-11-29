require 'test_helper'

class MonthlypaymentsControllerTest < ActionController::TestCase
  setup do
    @monthly_payment = monthlypayments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthlypayment" do
    assert_difference('Monthlypayment.count') do
      post :create, monthly_payment: { expiration: @monthly_payment.expiration, interest: @monthly_payment.interest, passenger_id: @monthly_payment.passenger_id, value: @monthly_payment.value }
    end

    assert_redirected_to monthlypayment_path(assigns(:monthly_payment))
  end

  test "should show monthlypayment" do
    get :show, id: @monthly_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_payment
    assert_response :success
  end

  test "should update monthlypayment" do
    patch :update, id: @monthly_payment, monthly_payment: { expiration: @monthly_payment.expiration, interest: @monthly_payment.interest, passenger_id: @monthly_payment.passenger_id, value: @monthly_payment.value }
    assert_redirected_to monthlypayment_path(assigns(:monthly_payment))
  end

  test "should destroy monthlypayment" do
    assert_difference('Monthlypayment.count', -1) do
      delete :destroy, id: @monthly_payment
    end

    assert_redirected_to monthlypayments_path
  end
end
