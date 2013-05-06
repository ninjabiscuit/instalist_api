require 'test_helper'

class UpdatingAnItemTest < ActionDispatch::IntegrationTest

  setup do
    @list = FactoryGirl.create(:list, name: Faker::Name.name)
    @item = FactoryGirl.create(:item, name: "boom", list: @list)
  end

  # test "I can update a item using the API" do

  #   item = { name: Faker::Name.name }
  #   api_put item_path(@item), item: item

  #   json = JSON.parse(response.body)

  #   assert_response 200
  #   assert_equal item[:name], json['name']
  # end

  test "I can see the edit form page" do
    get edit_list_item_path(@list, @item)
    assert_response 200
  end

  test "I can edit an existing item" do

    name = Faker::Name.name

    visit edit_list_item_path(@list, @item)
    fill_in 'item_name', :with => name
    click_button "Update Item"

    @item.reload

    assert_equal @item.name, name
    assert_equal list_item_path(@list, @item), current_path

  end

end