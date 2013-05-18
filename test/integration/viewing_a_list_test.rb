require 'test_helper'

class ViewingAListTest < ActionDispatch::IntegrationTest

  setup do
    @list = FactoryGirl.create(:list)
  end

  test "I can get a list using the API" do

    api_get list_path(@list)

    json = JSON.parse(response.body)

    assert_response 200
    assert_equal @list.name, json['name']
  end

end