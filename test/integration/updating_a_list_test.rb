require 'test_helper'

class UpdatingAListTest < ActionDispatch::IntegrationTest

  setup do
    @list = FactoryGirl.create(:list, name: "boom")
  end

  # test "I can update a list using the API" do

  #   list = { name: Faker::Name.name }
  #   api_put list_path(@list), list: list

  #   json = JSON.parse(response.body)

  #   assert_response 200
  #   assert_equal list[:name], json['name']
  # end

  test "I can see the edit form page" do
    get edit_list_path(@list)
    assert_response 200
  end

  test "I can edit an existing list" do

    name = Faker::Name.name

    visit edit_list_path(@list)
    fill_in 'list_name', :with => name
    click_button "Update List"

    @list.reload

    assert_equal @list.name, name
    assert_equal list_path(@list), current_path

  end

end