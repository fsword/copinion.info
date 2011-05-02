class MyController < ApplicationController

  before_filter :required_user

  def index
    @opinions = current_user.opinions
  end

  def leaders
    @leaders = current_user.leaders
  end

  def foers
    @foers = current_user.foers
  end

  def comments
    @opinions = current_user.opinions.where('topic_id not null')
  end

  def to_mes
    @opinions = current_user.concerns
  end
end
