require 'json'

class Game
  SEGMENTS_FILE = "config/segments.json"

  def initialize
    load_segments
  end

  def start
    ended = false
    segment_ref = :"0"

    loop do
      segment = @segments[segment_ref]

      show_segment(segment)
      segment_ref = read_option(segment)

      break if segment_ref == @segments.count
    end
  end

  private

  def read_option(segment)
    read_input(segment) || read_option(segment)
  rescue
    read_option(segment)
  end

  def read_input(segment)
    puts "Choose option: "
    input = Integer(gets.chomp)
    segment[:options].to_a[input - 1][0]
  end

  def load_segments
    @segments = JSON.parse(File.read(SEGMENTS_FILE), symbolize_names: true)
  end

  def show_segment(segment)
    Display.new.show(segment)
  end
end
