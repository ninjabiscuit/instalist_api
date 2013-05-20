require 'test_helper'

class CreatingUserTest < ActionDispatch::IntegrationTest

  test "I can create a user" do

    user = { email: Faker::Internet.email, password: "Password1", password_confirmation: "Password1" }
    api_post users_path, user: user
    json = JSON.parse(response.body)
    assert_response 200
    assert_equal user[:email], json['email']
  end

end