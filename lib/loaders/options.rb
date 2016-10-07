require "json"
require_relative "../segments/options"

module Loaders
  class Options
    def self.load
      json = JSON.parse(
        File.read("config/options.json"),
        symbolize_names: true
      )

      json.each_with_object({}) do |(id, segment), segments|
        segments[id] = Segments::Options.new(
          title:       segment[:title],
          description: segment[:description],
          options:     segment[:options],
        )
        segments
      end
    end
  end
end
