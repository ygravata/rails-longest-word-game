class GamesController < ApplicationController
  def new
    @letters = random_letter(rand(5..10)).chars
  end

  def score
    array = []
    params[:word].chars.each do |letter|
      array << params[:letters_joined].include?(letter)
    end
    if array.include?(false)
      @built_or_not = false
    else
      @built_or_not = true
    end
  end

  def random_letter(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end
end
