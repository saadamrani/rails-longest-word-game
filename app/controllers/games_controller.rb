require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ("A".."Z").to_a.sample }
  end

  def score
    @answer = params[:new]
    @letters = params[:letters]
    valid = true
    @score = 0
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    dict_s = open(url).read
    dict = JSON.parse(dict_s)
    found = dict["found"]
    if found || @letters.include?(@answer)
      @score = 10
    end
  end
end
