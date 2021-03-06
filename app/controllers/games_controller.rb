class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :get_players, only: [:new, :edit]
  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    if !(params[:game][:winner_score].to_i > params[:game][:loser_score].to_i)
      @game.winner_id = params[:game][:loser_id].to_i
      @game.loser_id = params[:game][:winner_id].to_i
      @game.winner_score = params[:game][:loser_score].to_i
      @game.loser_score = params[:game][:winner_score].to_i
    end

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if !(params[:game][:winner_score].to_i > params[:game][:loser_score].to_i)
      @game.winner_id = params[:game][:loser_id].to_i
      @game.loser_id = params[:game][:winner_id].to_i
      @game.winner_score = params[:game][:loser_score].to_i
      @game.loser_score = params[:game][:winner_score].to_i
    end
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def get_players
      @players = Player.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:winner_id, :loser_id, :winner_score, :loser_score)
    end
end
