require 'multi_json'

module Paddy
  module Model
    class FileModel
      def initialize(file_name)
        @file_name = file_name

        base_name = File.split(file_name)[-1]
        @id = File.basename(base_name, 'json').to_i
        obj = File.read(file_name)
        @hash = MultiJson.load obj
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        FileModel.new("db/quotes/#{id}.json")
      rescue
        nil
      end
    end
  end
end
