#!/usr/bin/env ruby

class Movie
  attr_reader :title, :director, :year

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year
  end

  def self.read_films_from_file(folder_name)
    file_names = Dir.glob("#{folder_name}/*")

    films = []
    file_names.map do |file_name|
      f = File.open(file_name, 'r:UTF-8')
      lines = f.readlines
      film = self.new(lines[0], lines[1], lines[2])
      films << film
    end

    films
  end
end
