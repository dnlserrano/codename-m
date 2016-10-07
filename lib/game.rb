require_relative "loaders/options"

class Game
  SEGMENTS_FILE = "config/segments.json"

  def initialize
    load_options_segments
  end

  def start
    segment = @segments.values.first

    loop do
      segment_id = segment.next_segment_id
      segment = @segments[segment_id]

      break if segment.final?
    end
  end

  private

  def load_options_segments
    @segments = Loaders::Options.load
  end
end
