class ScoresController < ApplicationController

  def index
  end

  def create
    @score = Score.new(home_team: params[:home_team], home_team_score: params[:home_team_score], away_team: params[:away_team], away_team_score: params[:away_team_score])
    if @score.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @score.errors.full }, status: 422
    end
  end
end
