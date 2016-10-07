module Stories
  class Display
    def show(params = {})
      title       = params.fetch(:title)
      description = params.fetch(:description)
      options     = params[:options] || []

      puts("-" * description.length)
      puts title
      puts description

      options.values.each_with_index do |option, i|
        puts((i + 1).to_s + ". " + option)
      end unless options.empty?

      puts("-" * description.length)
    end
  end
end

module Stories
  class Game
    SEGMENTS = {
      0 => {
        title: "Amnesia",
        description: "You don't remember a thing. You're alone in the middle of nowhere. You have a smartphone in your pocket.",
        options: {
          1 => "Get smartphone and call agency.",
          2 => "You start running.",
          3 => "You yell.",
        },
      },
      1 => {
        title: "You get your phone",
        description: "You have 33 missed calls. Your phone is broken in the left upper corner. But it seems to work fine.",
        options: {
          0 => "Disregard smarphone.",
          4 => "See missed calls.",
        },
      },
      4 => {
        title: "You check your missed calls",
        description: "Missed calls list reads 21 missed calls from a contact named M. 12 missed calls from a contact named Amanda.",
        options: {
          0 => "Disregard smarphone.",
          5 => "Call M.",
          6 => "Call Amanda.",
        },
      }
    }

    def start
      ended = false
      segment_no = 0

      loop do
        segment = SEGMENTS[segment_no]

        show_segment(segment)
        segment_no = read_option(segment)

        break if segment_no == SEGMENTS.count
      end
    end

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

    def show_segment(segment)
      Stories::Display.new.show(segment)
    end
  end
end

Stories::Game.new.start
