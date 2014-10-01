require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
   add_filter 'app/admin'
   add_filter 'app/controllers/application_controller.rb'
end