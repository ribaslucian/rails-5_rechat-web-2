class Researcher::DashboardController < ApplicationController

  def index
    @messages = Message.all.where('interaction_id IS NULL')
  end

end