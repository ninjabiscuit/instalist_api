require 'test_helper'

class ListingItemsTest < ActionDispatch::IntegrationTest

  setup do
    @list1 = FactoryGirl.create(:list)

    @item1 = FactoryGirl.create(:item, name: "item1", list: @list1)
    @item2 = FactoryGirl.create(:item, name: "item2", list: @list1)

    @list2 = FactoryGirl.create(:list)

    @item3 = FactoryGirl.create(:item, name: "item3", list: @list2)
    @item4 = FactoryGirl.create(:item, name: "item4", list: @list2)
  end

  test "I can get the items index page" do

    api_get list_items_path(@list1)

    assert_equal 200, response.status
    json = JSON.parse(response.body)
    assert_equal 2, json.length

    assert_not_nil json.detect {|a| a['name'] == @item1.name }
    assert_not_nil json.detect {|a| a['name'] == @item2.name }

    assert_nil json.detect {|a| a['name'] == @item3.name }
    assert_nil json.detect {|a| a['name'] == @item4.name }
  end

end