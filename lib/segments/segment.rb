module Segments
  class Segment
    attr_accessor :title, :description

    def initialize(title:, description:, final: false)
      @title       = title
      @description = description
      @final       = final
    end

    def next_segment_id
      raise NotImplementedError
    end

    def final?
      @final
    end
  end
end
