require 'test_helper'

class ListingListsTest < ActionDispatch::IntegrationTest

  setup do
    @list1 = FactoryGirl.create(:list)
    @list2 = FactoryGirl.create(:list)
  end

  test "I can get the lists index page" do
    visit lists_path
    assert page.has_content? @list1.name
    assert page.has_content? @list2.name
  end

end