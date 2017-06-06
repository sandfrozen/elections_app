class ElectionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_election, only: [:show, :edit, :update, :destroy]

  # GET /elections
  # GET /elections.json
  def index
    @election = Election.new
    @past_elections = Election.where("stop < ?", (Time.now))
    @actual_elections = Election.where("start < ? AND stop > ?", (Time.now), (Time.now))
    @future_elections = Election.where("start > ?", (Time.now))
  end

  # GET /elections/1
  # GET /elections/1.json
  def show
  end

  # GET /elections/new
  def new
    @election = Election.new
  end

  # GET /elections/1/edit
  def edit
  end

  # POST /elections
  # POST /elections.json
  def create
    @election = Election.new(election_params)

    respond_to do |format|
      if @election.save
        format.html { redirect_to elections_path, notice: 'Wybory zostały dodane' }
        format.json { render :show, status: :created, location: @election }
      else
        format.html { render :new }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elections/1
  # PATCH/PUT /elections/1.json
  def update
    respond_to do |format|
      if @election.update(election_params)
        format.html { redirect_to elections_path, notice: 'Wybory zoostały zaktualizowane' }
        format.json { render :show, status: :ok, location: @election }
      else
        format.html { render :edit }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/1
  # DELETE /elections/1.json
  def destroy
    @election.destroy
    respond_to do |format|
      format.html { redirect_to elections_url, notice: 'Wybory zostały usunięte' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election
      @election = Election.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def election_params
      params.require(:election).permit(:name, :election_type_id, :info, :start, :stop, :max_votes)
    end
end
