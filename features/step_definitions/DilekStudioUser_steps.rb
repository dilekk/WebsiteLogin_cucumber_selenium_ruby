require "json"
require "selenium-webdriver"
require "rspec"
require 'rubygems'
require 'highline/import'
include RSpec::Expectations

	
Given(/^navigate to FireFox CES Site$/) do
	#pending # Write code here that turns the phrase above into concrete actions
	#pending # Write code here that turns the phrase above into concrete actions
	@driver = Selenium::WebDriver.for :firefox
	@driver.navigate.to "https://websitename.com"
	@driver.manage.timeouts.implicit_wait = 30
	@driver.find_element(:link, "here").click
end

Given(/^Studio User enters the username and password on the command line$/) do
 # pending # Write code here that turns the phrase above into concrete actions
  @username = ask("Enter your username:  ") { |q| q.echo = true }
  @password = ask("Enter your password:  ") { |q| q.echo = "*" }

end

When(/^Logged in to Studio User Site$/) do
  #pending # Write code here that turns the phrase above into concrete actions
   #@driver.get(@base_url + "/")
    @driver.find_element(:id, "studio_user_email").clear
    @driver.find_element(:id, "studio_user_email").send_keys @username
    @driver.find_element(:id, "studio_user_password").clear
    @driver.find_element(:id, "studio_user_password").send_keys @password
	end

Then(/^Show message Logged in Successfully$/) do 
 #pending # Write code here that turns the phrase above into concrete actions
	wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
	begin
		element = wait.until{@driver.find_element(:id => "flash_notice").text.include?("Signed in successfully.")}
	ensure
	@driver.quit
	end
end
