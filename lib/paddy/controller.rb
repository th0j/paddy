require 'erubis'
require 'paddy/file_model'

module Paddy
  class Controller
    include Paddy::Model

    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      file_name = File.join 'app', 'views', controller_name, "#{view_name}.html.erb"
      template = File.read file_name
      eruby = Erubis::Eruby.new template
      eruby.result locals.merge(env: env)
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ''
      Paddy.to_underscore klass
    end

    def request
      @_request ||= Rack::Request.new @env
    end

    def params
      request.params
    end

    def response(text, status = 200, headers = {})
      raise 'Already responsed!' if @response
      @response = Rack::Response.new([text].flatten, status, headers)
    end

    def get_response
      @response
    end

    def render_response(*args)
      response(render(*args))
    end
  end
end
