class Researcher::DashboardController < ApplicationController

  def index
    @messages = Message.all
  end

end