#!/usr/bin/env ruby
require_relative 'colorful_output'
require_relative 'movie_methods'

class GameFilms
  include ColorfulOutput
  include MovieMethods

  MAX_RANDOM_DIRECTORS = 3

  def initialize(folder_name, count_questions)
    @films = read_films_from_file(folder_name)
    @count_questions = count_questions
  end

  def start_game
    count_right_answers = 0

    questions_for_game.each do |question|
      puts "Кто снял " + pastel.yellow("#{question.title.strip} (#{question.year.strip})?")

      variant_directors = get_rand_directors(question.director).push(question.director).shuffle

      variant_directors.each_with_index do |director, index|
        puts "#{index + 1}. #{director}"
      end

      user_answer = get_user_answer(variant_directors.size)

      if variant_directors[user_answer - 1] == question.director
        count_right_answers += 1
        puts pastel.bold.green("Верно! Так держать!\n")
      else
        puts pastel.bold.red("Неправильно :( \nПравильный ответ: #{question.director}")
      end
    end

    count_right_answers
  end

  private

  def questions_for_game
    @films.sample(@count_questions)
  end

  def get_rand_directors(director)
    all_directors.delete(director)
    all_directors.sample(MAX_RANDOM_DIRECTORS)
  end

  def all_directors
    @all_directors ||= @films.map(&:director).uniq
  end

  def get_user_answer(size)
    user_answer = nil
    until (1..size).include?(user_answer)
      puts "Введите число от 1 до #{size}:"
      user_answer = STDIN.gets.to_i
    end
    user_answer
  end
end
