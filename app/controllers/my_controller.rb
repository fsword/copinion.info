class MyController < ApplicationController

  def index
    @opinions = current_user.opinions
  end

end
