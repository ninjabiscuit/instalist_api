require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = FactoryGirl.create(:item)
  end

  test "should get index" do
    api_get :index, list_id: @item.list.to_param
    assert_response :success
  end

  test "should get new" do
    api_get :new, list_id: @item.list.to_param
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      api_post :create, item: { name: "blah" }, list_id: @item.list.id
    end

    assert_response :success
  end

  test "should show item" do
    api_get :show, id: @item, list_id: @item.list.to_param
    assert_response :success
  end

  test "should get edit" do
    api_get :edit, id: @item, list_id: @item.list.to_param
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { name: @item.name }, list_id: @item.list.to_param
    assert_response :success
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      api_delete :destroy, id: @item, list_id: @item.list
    end
    assert_response :success
  end
end
