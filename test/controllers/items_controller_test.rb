require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = FactoryGirl.create(:item)
  end

  test "should get index" do
    get :index, list_id: @item.list.to_param
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new, list_id: @item.list.to_param
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { name: "blah" }, list_id: @item.list.id
    end

    # assert_difference('Award.count') do
    #   post :create, :award => { :year => 2008, :name => 'Test award' }, :student_id => students(:giles).id

    assert_redirected_to list_item_path(@item.list, assigns(:item))
  end

  test "should show item" do
    get :show, id: @item, list_id: @item.list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item, list_id: @item.list.to_param
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { name: @item.name }, list_id: @item.list.to_param
    assert_redirected_to list_item_path(@item.list, assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item, list_id: @item.list
    end

    assert_redirected_to list_items_path(@item.list)
  end
end
