require 'selenium-webdriver'
require 'capybara'
require 'capybara/rspec'
require 'faker'
require 'cpf_faker'

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

Capybara.page.driver.browser.manage.window.resize_to(1850,1070)

Capybara.app_host = 'https://qa-plataforma.isvor.com.br'

RSpec.configure do |config|
  config.before(:example) { @login = 'felipez7989@gmail.com' }
  config.before(:example) { @senha = '123456' }
end