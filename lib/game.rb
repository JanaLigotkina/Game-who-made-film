#!/usr/bin/env ruby
require_relative 'colorful_output'

class GameFilms
  include ColorfulOutput

  MAX_RANDOM_DIRECTORS = 3

  def initialize(films, count_questions)
    @films = films
    @count_questions = count_questions
    @all_directors = films.map(&:director).uniq
  end

  def start_game
    puts pastel.bold.green("Добрый день, любитель кино!")
    puts pastel.bold.green("Давай посмотрим, хорошо ли ты знаешь какой режиссер какой фильм снял?\n")

    game_result = play_rounds

    puts pastel.bold.yellow("Вы угадали #{game_result} режиссеров из #{@count_questions}")
  end

  private

  def questions_for_game
    @films.sample(@count_questions)
  end

  def get_rand_directors(director)
    @all_directors.delete(director)
    @all_directors.sample(MAX_RANDOM_DIRECTORS)
  end

  def play_rounds
    count_right_answers = 0

    questions_for_game.each do |question|
      puts "Кто снял " + pastel.yellow("#{question.title.strip} (#{question.year.strip})?")

      variant_directors = get_rand_directors(question.director).push(question.director).shuffle

      variant_directors.each_with_index do |director, index|
        puts "#{index + 1}. #{director}"
      end

      user_answer = STDIN.gets.to_i

      if variant_directors[user_answer - 1] == question.director
        count_right_answers += 1
        puts pastel.bold.green("Верно! Так держать!\n")
      else
        puts pastel.bold.red("Неправильно :( \nПравильный ответ: #{question.director}")
      end
    end

    count_right_answers
  end
end
