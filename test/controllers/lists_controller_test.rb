# require 'test_helper'

# class ListsControllerTest < ActionController::TestCase
#   setup do
#     @list = FactoryGirl.create(:list)
#   end

#   test "should get index" do
#     api_get :index
#     assert_response :success
#   end

#   test "should create list" do
#     assert_difference('List.count') do
#       api_post :create, list: { name: @list.name }
#     end
#     assert_response :success
#   end

#   test "should show list" do
#     api_get :show, id: @list
#     assert_response :success
#   end

#   test "should update list" do
#     patch :update, id: @list, list: { name: @list.name }
#     assert_response :success
#   end

#   test "should destroy list" do
#     assert_difference('List.count', -1) do
#       api_delete :destroy, id: @list
#     end
#     assert_response :success
#   end
# end
