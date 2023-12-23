#!/usr/bin/env ruby

require_relative 'lib/movie'
require_relative 'lib/game'

films = Movie.read_films_from_file('data')

game = GameFilms.new(films, 3)
game.start_game
