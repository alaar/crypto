class HomeController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    @url = "https://api.coinmarketcap.com/v1/ticker/"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)

    @my_coins = ["BTC","XRP","ADA","XLM","STEEM"]

  end

  def about
  end

  def lookup
    @url = "https://api.coinmarketcap.com/v1/ticker/"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coins = JSON.parse(@response)

    @symbol = params[:sym]
    @symbol = @symbol.upcase if @symbol
    @symbol = "Hey you forgot to enter a currency" if @symbol == ""
  end

end
