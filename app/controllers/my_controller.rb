class MyController < ApplicationController

  before_filter :required_user

  def index
    @opinions = current_user.opinions
  end

end
