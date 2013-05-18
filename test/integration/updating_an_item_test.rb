require 'test_helper'

class UpdatingAnItemTest < ActionDispatch::IntegrationTest

  setup do
    @list = FactoryGirl.create(:list, name: Faker::Name.name)
    @item = FactoryGirl.create(:item, name: "boom", list: @list)
  end

  test "I can update a item using the API" do

    item = { name: Faker::Name.name }
    api_put list_item_path(@list, @item), item: item

    json = JSON.parse(response.body)

    assert_response 200
    assert_equal item[:name], json['name']
  end

end