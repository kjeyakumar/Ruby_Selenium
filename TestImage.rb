require 'rubygems'
require 'selenium-webdriver'

browser = Selenium::WebDriver.for :firefox
browser.get 'http://www.google.ca'

wait = Selenium::WebDriver::Wait.new(:timeout => 15)

# Check that the image exists using different attributes and xpath

puts "Test Passed: Found a graphic with the path '/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png' in the source filename" if wait.until {
  browser.find_element(:xpath => "//img[@style='background:url(/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png) no-repeat;background-size:272px 92px;height:92px;width:272px']").displayed?
}

=begin
puts "Test Passed: Found a graphic with the name watergraphic" if wait.until {
  browser.find_element(:name, "watergraphic").displayed?
}

puts "Test Passed: Found a graphic with 'Image of water faucet' as alt text" if wait.until {
  browser.find_element(:xpath => "//img[@alt='Image of water faucet']").displayed?
}

# Click the image button
image = wait.until {
  element = browser.find_element(:xpath => "//img[@src='images/totoro.gif']")
  element if element.displayed?
}
image.click

# Check the text on the new page
puts "Test Passed: Page 1 Validated" if wait.until {
  /Test Automation Training/.match(browser.page_source)
}
=end

browser.quit