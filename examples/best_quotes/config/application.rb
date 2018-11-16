$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')

require 'paddy'
# require 'quotes_controller'
module BestQuotes
  class Application < Paddy::Application
  end
end
