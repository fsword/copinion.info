class WelcomeController < ApplicationController

  def index
    @opinions = Opinion.all
  end

end
