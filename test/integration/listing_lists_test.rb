require 'test_helper'

class ListingListsTest < ActionDispatch::IntegrationTest

  setup do
    @list1 = FactoryGirl.create(:list)
    @list2 = FactoryGirl.create(:list)
  end

  test "I can get the lists index page" do
    api_get lists_path
    assert_equal 200, response.status
    json = JSON.parse(response.body)
    assert_equal 2, json.length
    assert_not_nil json.detect {|a| a['id'] == @list1.id }
    assert_not_nil json.detect {|a| a['id'] == @list2.id }
  end

end