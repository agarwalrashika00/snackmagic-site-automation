require 'selenium-webdriver'
require 'page-object'
require 'data_magic'
require 'capybara'
require 'capybara/cucumber'

Before do |scenario|
    Capybara.default_driver= :selenium
    Capybara.register_driver :selenium do |app|
        @app = app
    end
    @browser = Capybara::Selenium::Driver.new(@app, browser: :chrome)
    @browser.maximize_window(@browser.current_window_handle)

    Capybara.ignore_hidden_elements = false

    DataMagic.yml_directory = 'C:\Users\Rashika\Desktop\snackmagic\features\data\yml'
    DataMagic.load 'data.yml'

end

After do |scenario|
    @browser.quit
end