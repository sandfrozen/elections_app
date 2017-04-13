class ElectionUsersController < ApplicationController
  before_action :set_election_user, only: [:show, :edit, :update, :destroy]

  # GET /election_users
  # GET /election_users.json
  def index
    @election_users = ElectionUser.all
  end

  # GET /election_users/1
  # GET /election_users/1.json
  def show
  end

  # GET /election_users/new
  def new
    @election_user = ElectionUser.new
  end

  # GET /election_users/1/edit
  def edit
  end

  # POST /election_users
  # POST /election_users.json
  def create
    @election_user = ElectionUser.new(election_user_params)

    respond_to do |format|
      if @election_user.save
        format.html { redirect_to @election_user, notice: 'Election user was successfully created.' }
        format.json { render :show, status: :created, location: @election_user }
      else
        format.html { render :new }
        format.json { render json: @election_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /election_users/1
  # PATCH/PUT /election_users/1.json
  def update
    respond_to do |format|
      if @election_user.update(election_user_params)
        format.html { redirect_to @election_user, notice: 'Election user was successfully updated.' }
        format.json { render :show, status: :ok, location: @election_user }
      else
        format.html { render :edit }
        format.json { render json: @election_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /election_users/1
  # DELETE /election_users/1.json
  def destroy
    @election_user.destroy
    respond_to do |format|
      format.html { redirect_to election_users_url, notice: 'Election user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election_user
      @election_user = ElectionUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def election_user_params
      params.require(:election_user).permit(:vote, :User_id, :Election_id)
    end
end
