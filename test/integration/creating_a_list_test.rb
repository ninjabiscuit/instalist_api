require 'test_helper'

class CreatingAListTest < ActionDispatch::IntegrationTest

  test "I can create a list" do

    list = { name: Faker::Name.name }
    api_post lists_path, list: list
    json = JSON.parse(response.body)
    assert_response 200
    assert_equal list[:name], json['name']
  end

end