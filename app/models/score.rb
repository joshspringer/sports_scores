class Score < ApplicationRecord
  validates :home_team, presence: true
  validates :home_team_score, presence: true
  validates :away_team, presence: true
  validates :away_team_score, presence: true
  def winner
    if home_team_score > away_team_score
      home_team
    elsif away_team_score > home_team_score
      away_team
    else
      'tie'
    end
  end
end
