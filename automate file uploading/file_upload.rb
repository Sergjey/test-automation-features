require 'selenium-webdriver'

# Set the file path
file_path = File.expand_path(File.dirname(__FILE__)) + '/lenna.png'

# Create a WebDriver object for the Chrome browser
driver = Selenium::WebDriver.for :chrome

# Open the page with the file upload form
driver.get "file://#{File.expand_path(File.dirname(__FILE__))}/index.html"

# Find the <input type="file"> element
file_input = driver.find_element(id: 'file')

# Upload the file
file_input.send_keys file_path

# Find and submit the form
submit_button = driver.find_element(id: 'submit')
submit_button.click

# Close the browser
driver.quit
