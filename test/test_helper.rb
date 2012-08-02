# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine for functional tests
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

# Load fixtures from the engine for integration tests
if ActionDispatch::IntegrationTest.method_defined?(:fixture_path=)
  ActionDispatch::IntegrationTest.fixture_path = File.expand_path("../fixtures", __FILE__)
end

# Patch TestCase to provide routes: 
# See https://github.com/rails/rails/issues/6573
class ActionController::TestCase
  def method_missing(selector, *args)
    if @controller.respond_to?(:_routes) &&
        ( @controller._routes.named_routes.helpers.include?(selector) ||
          @controller._routes.mounted_helpers.method_defined?(selector) )
      @controller.__send__(selector, *args)
    else
      super
    end
  end    
end

