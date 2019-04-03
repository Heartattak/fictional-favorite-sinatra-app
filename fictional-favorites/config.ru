require './config/environment'
require 'sinatra'
require_relative './application_controller.rb'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
