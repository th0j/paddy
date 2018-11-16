module Paddy
  class Application
    def controller_and_action(env)
      _, cont, action, _after = env['PATH_INFO'].split('/', 4)
      cont = cont.capitalize
      cont += 'Controller'

      # Lookup  any name starting with capital letter in controller class
      [Object.const_get(cont), action]
    end
  end
end
