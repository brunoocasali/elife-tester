require 'capybara'
require 'capybara/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'http://app.buzzmonitor.com.br'
end