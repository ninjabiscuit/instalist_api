ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase

  ActiveRecord::Migration.check_pending!
  include ApiTestHelper

end

class ActionDispatch::IntegrationTest

  include Capybara::DSL
  include ApiTestHelper

end