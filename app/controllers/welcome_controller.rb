class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @past_elections = Election.where("end < ?", (Time.now))
    @actual_elections = Election.where("start < ? AND end > ?", (Time.now), (Time.now))
    @future_elections = Election.where("start > ?", (Time.now))

  end

  def vote
    @election = Election.find(params[:id])
  end

  def election_result
    @election = Election.find(params[:id])
  end

  def election_info
    @election = Election.find(params[:id])
  end

  def your_candidatures
    @elections = Election.joins(:election_users).where("election_user.user_id = ?", current_user.id)
    @current_user_id = current_user.id
    puts "current user id: #{current_user.id}"
    #puts "elections count: #{@elections.size}"
  end

end
