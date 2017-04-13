class WelcomeController < ApplicationController
  def index
    @elections = Election.where("start < ?", (Time.now))

  end

  def vote
    @election = Election.find(params[:id])
  end

end
