require 'test_helper'

class CreatingAnItemTest < ActionDispatch::IntegrationTest

  setup do
    @list = FactoryGirl.create(:list, name: Faker::Name.name)
  end

  test "I can create an item using the API" do

    item = { name: Faker::Name.name,  list_id: @list.to_param }
    api_post list_items_path(@list), item: item

    json = JSON.parse(response.body)

    assert_response 201
    assert_equal item[:name], json['name']

  end

  test "I can see the form page" do
    get new_list_item_path(@list)
    assert_response 200
  end

  test "I can create a new item" do

    name = Faker::Name.name

    visit new_list_item_path(@list)
    fill_in 'item_name', :with => name
    click_button "Create Item"

    new_item = Item.find_by_name(name)

    assert new_item.present?
    assert_equal list_item_path(@list, new_item), current_path

  end

end