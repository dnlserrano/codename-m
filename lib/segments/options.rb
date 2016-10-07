require_relative "segment"
require_relative "../display"

module Segments
  class Options < Segment
    attr_accessor :options

    def initialize(title:, description:, options:, final: false)
      super(title: title, description: description, final: final)
      @options = options
    end

    def next_segment_id
      show_text
      read_option || read_input
    rescue
      read_option
    end

    private

    def show_text
      Display.new.show(
        title: title,
        description: description,
        options: options,
      )
    end

    def read_option
      puts "Choose option: "
      input = Integer(gets.chomp)
      options.to_a[input - 1][0]
    end
  end
end
