require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

# Set up the Ruby DSL language for Capybara
Capybara.default_driver = :selenium
Capybara.run_server = false
Capybara.app_host = 'http://example.com'  # Replace with the URL of your website

# Class where our script will be executed
class Example
  include Capybara::DSL

  def initialize
    visit('/')
  end

  def scroll_to_element(text)
    page.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    page.find('xpath', "//*[contains(text(),'#{text}')]").visible?
  end

  def take_screenshot(filename)
    page.save_screenshot(filename)
  end
end

# Create an instance of the class and perform the required actions
example = Example.new
example.scroll_to_element('Desired text on the page')
example.take_screenshot('screenshot.png')
