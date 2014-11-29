require 'test_helper'

class PassengersControllerTest < ActionController::TestCase
  setup do
    @passenger = passengers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:passengers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create passenger" do
    assert_difference('Passenger.count') do
      post :create, passenger: { administrator_id: @passenger.administrator_id, contract_order: @passenger.contract_order, contract_start: @passenger.contract_start, passenger_address: @passenger.passenger_address, passenger_birthday: @passenger.passenger_birthday, passenger_cpf: @passenger.passenger_cpf, passenger_email: @passenger.passenger_email, passenger_name: @passenger.passenger_name, passenger_phone: @passenger.passenger_phone, responsible_cpf: @passenger.responsible_cpf, responsible_email: @passenger.responsible_email, responsible_name: @passenger.responsible_name, responsible_phone: @passenger.responsible_phone }
    end

    assert_redirected_to passenger_path(assigns(:passenger))
  end

  test "should show passenger" do
    get :show, id: @passenger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @passenger
    assert_response :success
  end

  test "should update passenger" do
    patch :update, id: @passenger, passenger: { administrator_id: @passenger.administrator_id, contract_order: @passenger.contract_order, contract_start: @passenger.contract_start, passenger_address: @passenger.passenger_address, passenger_birthday: @passenger.passenger_birthday, passenger_cpf: @passenger.passenger_cpf, passenger_email: @passenger.passenger_email, passenger_name: @passenger.passenger_name, passenger_phone: @passenger.passenger_phone, responsible_cpf: @passenger.responsible_cpf, responsible_email: @passenger.responsible_email, responsible_name: @passenger.responsible_name, responsible_phone: @passenger.responsible_phone }
    assert_redirected_to passenger_path(assigns(:passenger))
  end

  test "should destroy passenger" do
    assert_difference('Passenger.count', -1) do
      delete :destroy, id: @passenger
    end

    assert_redirected_to passengers_path
  end
end
