class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :election_result, :election_info]

  def index
    @past_elections = Election.where("stop < ?", (Time.now))
    @actual_elections = Election.where("start < ? AND stop > ?", (Time.now), (Time.now))
    @future_elections = Election.where("start > ?", (Time.now))

  end

  def vote
    @isUserPermission = ElectionUser.where("User_id = ? and Election_id = ?", current_user.id, params[:id])

    if @isUserPermission.present?
      @election = Election.find(params[:id])
    else
      respond_to do |format|
        format.html { redirect_to root_path, warning: 'Nie możesz głosować w tych wyborach' }
        format.json { render :show, status: :created, location: @election }
      end
    end
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
