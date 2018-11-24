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

      def self.all
        files = Dir['db/quotes/*.json']
        files.map { |f| FileModel.new f }
      end

      def self.create(attrs)
        hash = {}
        hash[:submitter] = attrs[:submitter]
        hash[:quote] = attrs[:quote]
        hash[:attribution] =  attrs[:attribution]

        files = Dir['db/quotes/*.json']
        names = files.map { |f| f.split('/')[-1] }
        highest = names.map { |b| b[0...-5].to_i }.max
        id = highest + 1

        File.open("db/quotes/#{id}.json", 'w') do |f|
          f.write <<-TEMPLATE
          {
            "submitter": "#{hash[:submitter]}",
            "quote": "#{hash[:quote]}",
            "attribution": #{hash[:attribution]}
          }
          TEMPLATE
        end

        FileModel.new "db/quotes/#{id}.json"
      end
    end
  end
end
