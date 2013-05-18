require 'test_helper'

class UpdatingAListTest < ActionDispatch::IntegrationTest

  setup do
    @list = FactoryGirl.create(:list, name: "boom")
  end

  test "I can update a list" do

    list = { name: Faker::Name.name }
    api_put list_path(@list), list: list

    json = JSON.parse(response.body)

    assert_response 200
    assert_equal list[:name], json['name']
  end

end