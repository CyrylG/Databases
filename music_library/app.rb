# file: app.rb

require_relative "lib/database_connection"
require_relative "lib/album_repository"

class Application
  def initialize(music_library, io, album_repository)
    DatabaseConnection.connect(music_library)
    @io = io
    @album_repository = album_repository
  end

  def run
    @io.puts "What would you like to do?"
    @io.puts "1 - List all albums"
    choice = @io.gets.chomp

    if choice == "1"
      result = @album_repository.all
      result.each do |record|
        p "#{record.id} : #{record.title}"
      end
    end
  end

  if __FILE__ == $0
    app = Application.new(
      "music_library",
      Kernel,
      AlbumRepository.new
    )
    app.run
  end
end
