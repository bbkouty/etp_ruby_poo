# app.rb 
# require 'faker'
# require 'colorize' # this gem will put colors in the shell output
# puts "this \'1\' is a test for colorize".colorize(:blue)
require_relative 'lib/router'

Router.new.perform