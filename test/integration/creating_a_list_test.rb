require 'test_helper'

class CreatingAListTest < ActionDispatch::IntegrationTest

  test "I can create a list using the API" do

    list = { name: Faker::Name.name }
    api_post lists_path, list: list
    json = JSON.parse(response.body)
    assert_response 201
    assert_equal list[:name], json['name']

  end

  test "I can see the form page" do
    get root_url
    assert_response 200
  end

  test "I can create a new list" do

    name = Faker::Name.name

    visit new_list_path
    fill_in 'list_name', :with => name
    click_button "Create List"

    new_list = List.find_by_name(name)

    assert new_list.present?
    assert_equal list_path(new_list), current_path

  end

end