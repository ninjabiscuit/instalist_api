require 'test_helper'

class CreatingAnItemTest < ActionDispatch::IntegrationTest

  setup do
    @list = FactoryGirl.create(:list, name: Faker::Name.name)
  end

  test "I can create an item" do

    item = { name: Faker::Name.name,  list_id: @list.to_param }
    api_post list_items_path(@list), item: item

    json = JSON.parse(response.body)

    assert_response 200
    assert_equal item[:name], json['name']

  end

end