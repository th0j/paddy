require 'paddy/version'
require 'paddy/array'

module Paddy
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'}, ['Hello from Ruby on Rulers!']]
    end
  end
end
