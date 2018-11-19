require_relative 'test_helper'

class TestApp < Paddy::Application
  def controller_and_action(env)
    [TestController, 'index']
  end
end

class TestController < Paddy::Controller
  def index
    'Hello'
  end
end

class PaddyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/route/somewhere'
    assert last_response.ok?
    body = last_response.body
    assert body['Hello']
  end
end
