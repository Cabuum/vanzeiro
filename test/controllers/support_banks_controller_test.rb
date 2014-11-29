require 'test_helper'

class SupportBanksControllerTest < ActionController::TestCase
  setup do
    @support_bank = support_banks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_bank" do
    assert_difference('SupportBank.count') do
      post :create, support_bank: { full_name: @support_bank.full_name, name: @support_bank.name }
    end

    assert_redirected_to support_bank_path(assigns(:support_bank))
  end

  test "should show support_bank" do
    get :show, id: @support_bank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @support_bank
    assert_response :success
  end

  test "should update support_bank" do
    patch :update, id: @support_bank, support_bank: { full_name: @support_bank.full_name, name: @support_bank.name }
    assert_redirected_to support_bank_path(assigns(:support_bank))
  end

  test "should destroy support_bank" do
    assert_difference('SupportBank.count', -1) do
      delete :destroy, id: @support_bank
    end

    assert_redirected_to support_banks_path
  end
end
