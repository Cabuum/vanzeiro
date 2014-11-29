require 'test_helper'

class BanksControllerTest < ActionController::TestCase
  setup do
    @bank = banks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank" do
    assert_difference('Bank.count') do
      post :create, bank: { account: @bank.account, agency: @bank.agency, agreement: @bank.agreement, instruction1: @bank.instruction1, instruction2: @bank.instruction2, instruction3: @bank.instruction3, instruction4: @bank.instruction4, instruction5: @bank.instruction5, instruction6: @bank.instruction6, instruction7: @bank.instruction7, user_id: @bank.user_id }
    end

    assert_redirected_to bank_path(assigns(:bank))
  end

  test "should show bank" do
    get :show, id: @bank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bank
    assert_response :success
  end

  test "should update bank" do
    patch :update, id: @bank, bank: { account: @bank.account, agency: @bank.agency, agreement: @bank.agreement, instruction1: @bank.instruction1, instruction2: @bank.instruction2, instruction3: @bank.instruction3, instruction4: @bank.instruction4, instruction5: @bank.instruction5, instruction6: @bank.instruction6, instruction7: @bank.instruction7, user_id: @bank.user_id }
    assert_redirected_to bank_path(assigns(:bank))
  end

  test "should destroy bank" do
    assert_difference('Bank.count', -1) do
      delete :destroy, id: @bank
    end

    assert_redirected_to banks_path
  end
end
