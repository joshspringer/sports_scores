class Api::V2::ScoresController < Api::V2::ApplicationController # adding Api::V2:: to ApplicationController looks for it in api/v2 folder. Can also leave it off and leave file in main folder and will look for it there (same file applies to all versions)
  def index
    @scores = Score.all
    render 'index.json.jbuilder'
    # render 'index.html.erb'
  end

  def show
    @score = Score.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @score = Score.new(
      home_team: params[:home_team],
      home_team_score: params[:home_team_score],
      away_team: params[:away_team],
      away_team_score: params[:away_team_score],
      date: params[:date]
    )
    @score.save
    render 'show.json.jbuilder'
  end

  def update
    @score = Score.find_by(id: params[:id])
    @score.update(
      home_team: params[:home_team] || @score.home_team,
      home_team_score: params[:home_team_score] || @score.home_team_score,
      away_team: params[:away_team] || @score.away_team,
      away_team_score: params[:away_team_score] || @score.away_team_score,
      date: params[:date] || @score.date
    )
    @score.save
    render 'show.json.jbuilder'
  end

  def destroy
    @score = Score.find_by(id: params[:id])
    @score.destroy
    render json: { message: "You deleted a thing" }
    # render 'index.json.jbuilder'
  end
end
