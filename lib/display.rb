class Display
  def show(params = {})
    title       = params.fetch(:title)
    description = params.fetch(:description)
    options     = params[:options] || []

    puts("-" * description.length)
    puts title
    puts description

    options.values.each_with_index do |option, i|
      puts "#{i + 1}. #{option}"
    end unless options.empty?

    puts("-" * description.length)
  end
end
