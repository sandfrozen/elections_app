class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :election_result, :election_info]

  @@electionID = 0

  def index
    @past_elections = Election.where("stop < ?", (Time.now)).order(start: :desc)
    @actual_elections = Election.where("start < ? AND stop > ?", (Time.now), (Time.now)).order(start: :desc)
    @future_elections = Election.where("start > ?", (Time.now)).order(start: :desc)

  end

  def vote
    @isUserPermission = ElectionUser.where("user_id = ? and election_id = ? and vote is ?", current_user.id, params[:id], nil).to_a
    if @isUserPermission.length >0
      @election = Election.find(params[:id])
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Nie możesz głosować w tych wyborach' }
        format.json { render :show, status: :created, location: @election }
      end
    end
  end

  def save_vote
    candidates = params[:candidate]
    old_users = ElectionUser.where("user_id = ? and election_id = ? and vote is ?", current_user.id, params[:election_id], nil).to_a
    old_users.each { |old_user|
      old_user.destroy
    }

    max = params[:max_votes].to_i
    (0..candidates.length-1).each { |i|
      if i < max
        el_user = ElectionUser.new
        el_user.User = User.find(current_user.id)
        el_user.Election = Election.find(params[:election_id])
        el_user.vote = candidates[i]
        el_user.save
      end
    }
      respond_to do |format|
        format.html { redirect_to root_path, warning: 'Głos oddany' }
        format.json { render :show, status: :created, location: @election }
        end
  end

  def election_result

    @@electionID = params[:id]
    @election = Election.find(params[:id])
    @election_voters = ElectionUser.select(:user_id).where("election_id = ?",params[:id]).uniq.to_a
    @election_votes = ElectionUser.select(:user_id).where("election_id = ? and vote is not null",params[:id]).uniq.to_a
    @frequency = @election_votes.length.to_f / @election_voters.length.to_f * 100
    @results = ElectionUser.group(:vote).where("election_id = ?",params[:id]).order('count_all desc').count.to_a
    @candidates = User.all
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

  def generate
    Prawn::Document.generate("electionresults.pdf") do
      font_families.update("RobotoSlab" =>{
          :normal => Rails.root.join("app/assets/fonts/RobotoSlab-Regular.ttf").to_s,
      })
      font "RobotoSlab"
      election = Election.find(@@electionID)
      election_voters = ElectionUser.select(:user_id).where("election_id = ?",@@electionID).uniq.to_a.count.to_s
      election_votes = ElectionUser.select(:user_id).where("election_id = ? and vote is not null",@@electionID).uniq.to_a.count.to_s
      results = ElectionUser.group(:vote).where("election_id = ?",@@electionID).order('count_all desc').count.to_a
      frequency = election_votes.to_f / election_voters.to_f * 100
      candidates = User.all
      text "Wybory: " + election.name
      text "Typ wyborow: " + election.election_type.name
      text "Ilosc osob uprawnionych do glosowania: " + election_voters
      text "Ilosc osob ktore oddaly glos: " + election_votes
      text "Frekwencja: " + frequency.to_s + "%"
      text ""
      text ""
      text "Wyniki: "
      i=0
      results.each do |result|
          if result[0] == nil
            i-=1
          else
            if i==0
                text "Wygrany: " + candidates.where("id = ?",result[0]).to_a.first.name + " " + candidates.where("id = ?",result[0]).to_a.first.surname + ": " + result[1].to_s
            else
                text candidates.where("id = ?",result[0]).to_a.first.name + " " + candidates.where("id = ?",result[0]).to_a.first.surname + ": " + result[1].to_s
            end
          end
        i+=1
      end
    end
    pdf_filename = File.join(Rails.root, "electionresults.pdf")
    send_file("#{Rails.root}/electionresults.pdf", :filename => "electionresults.pdf", :type => "application/pdf")
  end
end
