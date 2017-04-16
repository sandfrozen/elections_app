class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @elections = Election.where("start < ? AND end > ?", (Time.now), (Time.now))

  end

  def vote
    @election = Election.find(params[:id])
  end

end
