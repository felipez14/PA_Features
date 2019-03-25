require 'capybara/cucumber'
require "selenium-webdriver"
require 'capybara'
require 'capybara/rspec'

Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 15
end

Capybara.app_host = 'http://wcd-qa.treetecnologia.com.br'

RSpec.configure do |config|
  Before do
    @login = 'englipe7989+5@gmail.com'
    @senha = '123456'
  end
end