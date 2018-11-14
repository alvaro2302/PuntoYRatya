require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'rack/test'
require 'rspec'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara
end

class MyWorld
  include Capybara::DSL
  
  def app
    Sinatra::Application
  end
  
end

World{MyWorld.new}