require 'paddy/version'
# require 'paddy/array'
require 'paddy/routing'
require 'paddy/util'
require 'paddy/dependencies'

module Paddy
  class Application
    def call(env)
      return [404, {'Content-Type' => 'text/html'}, []] if env['PATH_INFO'] == '/favicon.ico'

      klass, act = controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end

