require 'test_helper'

class MovementCategoriesControllerTest < ActionController::TestCase
  setup do
    @movement_category = movement_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movement_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movement_category" do
    assert_difference('MovementCategory.count') do
      post :create, movement_category: { name: @movement_category.name }
    end

    assert_redirected_to movement_category_path(assigns(:movement_category))
  end

  test "should show movement_category" do
    get :show, id: @movement_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movement_category
    assert_response :success
  end

  test "should update movement_category" do
    patch :update, id: @movement_category, movement_category: { name: @movement_category.name }
    assert_redirected_to movement_category_path(assigns(:movement_category))
  end

  test "should destroy movement_category" do
    assert_difference('MovementCategory.count', -1) do
      delete :destroy, id: @movement_category
    end

    assert_redirected_to movement_categories_path
  end
end
