require 'test_helper'

class ViewingAnItemTest < ActionDispatch::IntegrationTest

  setup do
    @item = FactoryGirl.create(:item)
  end

  test "I can get an item using the API" do

    api_get list_item_path(@item.list, @item)

    json = JSON.parse(response.body)

    assert_response 200
    assert_equal @item.name, json['name']
  end

  test "I can get an item" do
    visit list_item_path(@item.list, @item)
    assert page.has_content? @item.name
  end

end