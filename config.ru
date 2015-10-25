## rackup -> config.ru
require 'rubygems'
require 'bundler'
Bundler.require

## MVC
# Models
require './app'
require './models/brew'
# Views
#
# Controllers
require './controllers/brew_controller'

use Rack::MethodOverride
run BrewApp