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
    visit list_items_path(@list1)
    assert page.has_content? @item1.name
    assert page.has_content? @item2.name

    assert page.has_no_content? @item3.name
    assert page.has_no_content? @item4.name
  end

end