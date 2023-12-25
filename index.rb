#!/usr/bin/env ruby

require_relative 'lib/movie'
require_relative 'lib/game'
require_relative 'lib/colorful_output'

include ColorfulOutput

NUMBER_OF_QUESTION_FOR_GAME = 3

puts pastel.bold.green("Добрый день, любитель кино!")
puts pastel.bold.green("Давай посмотрим, хорошо ли ты знаешь какой режиссер какой фильм снял?\n")

game = GameFilms.new('data', NUMBER_OF_QUESTION_FOR_GAME)
game_result = game.start_game

puts pastel.bold.yellow("Вы угадали #{game_result} режиссеров из #{NUMBER_OF_QUESTION_FOR_GAME}")
