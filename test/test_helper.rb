ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
end

class ActionDispatch::IntegrationTest

  include Capybara::DSL

  API_MIME_TYPE_V1 = "application/vnd.instalist.api.v1+json"

  %w(get put post delete).each do |verb|
    define_method "api_#{verb}" do |url, params = {}, headers = {}|
      send(verb, url, params, { 'HTTP_ACCEPT' => API_MIME_TYPE_V1 }.merge(headers))
    end
  end

end