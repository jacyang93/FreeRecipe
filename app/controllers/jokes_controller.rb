class JokesController < ApplicationController
  def index
    @response = HTTParty.get('http://api.icndb.com/jokes/random')
  end
end
