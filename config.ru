# This file is used by Rack-based servers to start the application.
run proc { [200, {}, ["hello world!"]] } 

require_relative 'config/environment'

run Rails.application
Rails.application.load_server
