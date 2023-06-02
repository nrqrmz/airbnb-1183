require 'open-uri'

class FlatsController < ApplicationController
  def index
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    doc = URI.open(url).read
    @flats = JSON.parse(doc)
  end

  def show
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    doc = URI.open(url).read
    flats = JSON.parse(doc)
    @flat = flats.select do |flat|
      params[:id].to_i == flat['id']
    end.first
  end
end
