#file: my_test.rb
require 'rubygems'
require 'selenium-webdriver'
require 'test-unit'

class LocalTest < Test::Unit::TestCase


  # @return [Object]
  def setup
    @browser = Selenium::WebDriver.for :firefox
    @browser.get "file:///c:/Users/gkrishna/Desktop/HtmlTest/NewTest.html"
  end

  def test_page_title
    assert_equal @browser.title, "Testing with Ruby and Selenium WebDriver"
  end

  # @return [Object]
  def test_my_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 15)

    # Add text to a text box
    input = wait.until {
      element = @browser.find_element(:name, "searchbox")
      element if element.displayed?
    }
    input.send_keys('Information')

    # Check that the form exists
    form = wait.until {
      element = @browser.find_element(:name, "input")
      element if element.displayed?
    }
    puts "Test Passed: Form input found" if form.displayed?

    # Click the button based the form it is in (you can also call 'submit' method)
    form.find_element(:name, "submit").click
  end

  def teardown
    @browser.quit
  end

end