class ElectionCandidatesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_election_candidate, only: [:show, :edit, :update, :destroy]

  # GET /election_candidates
  # GET /election_candidates.json
  def index
    @election_candidates = ElectionCandidate.all
  end

  # GET /election_candidates/1
  # GET /election_candidates/1.json
  def show
  end

  # GET /election_candidates/new
  def new
    @election_candidate = ElectionCandidate.new
  end

  # GET /election_candidates/1/edit
  def edit
  end

  # POST /election_candidates
  # POST /election_candidates.json
  def create
    @election_candidate = ElectionCandidate.new(election_candidate_params)

    respond_to do |format|
      if @election_candidate.save
        format.html { redirect_to @election_candidate, notice: 'Election candidate was successfully created.' }
        format.json { render :show, status: :created, location: @election_candidate }
      else
        format.html { render :new }
        format.json { render json: @election_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /election_candidates/1
  # PATCH/PUT /election_candidates/1.json
  def update
    respond_to do |format|
      if @election_candidate.update(election_candidate_params)
        format.html { redirect_to @election_candidate, notice: 'Election candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @election_candidate }
      else
        format.html { render :edit }
        format.json { render json: @election_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /election_candidates/1
  # DELETE /election_candidates/1.json
  def destroy
    @election_candidate.destroy
    respond_to do |format|
      format.html { redirect_to election_candidates_url, notice: 'Election candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election_candidate
      @election_candidate = ElectionCandidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def election_candidate_params
      params.require(:election_candidate).permit(:party, :list, :place, :User_id, :Election_id)
    end
end
