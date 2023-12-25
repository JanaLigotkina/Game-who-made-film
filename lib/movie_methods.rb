#!/usr/bin/env ruby

module MovieMethods
  def read_films_from_file(folder_name)
    films = []
    file_names = Dir.glob("#{folder_name}/*")

    file_names.map do |file_name|
      f = File.open(file_name, 'r:UTF-8') if File.exist?(file_name)
      lines = f.readlines
      films << Movie.new(lines[0], lines[1], lines[2])
    end

    films
  end
end
