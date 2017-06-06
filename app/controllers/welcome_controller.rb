class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :election_result, :election_info]

  def index
    @past_elections = Election.where("stop < ?", (Time.now)).order(start: :DESC)
    @actual_elections = Election.where("start < ? AND stop > ?", (Time.now), (Time.now)).order("start DESC")
    @future_elections = Election.where("start > ?", (Time.now)).order(start: :DESC)

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

  def save_vote
    candidates = params[:candidate]
      for candidate in candidates
        el_user = ElectionUser.new
        el_user.User = User.find(current_user.id)
        el_user.Election = Election.find(params[:election_id])
        el_user.vote = candidate
        puts candidate
        el_user.save
        puts el_user.errors.full_messages
      end
      respond_to do |format|
        format.html { redirect_to root_path, warning: 'Głos oddany' }
        format.json { render :show, status: :created, location: @election }
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
