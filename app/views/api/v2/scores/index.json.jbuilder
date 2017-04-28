json.array! @scores.each do |score|
  # json.id score.id
  # json.home_team score.home_team
  # json.home_team_score score.home_team_score
  # json.away_team score.away_team
  # json.away_team_score score.away_team_score
  # @score = score
  # json.partial! 'scores/scorePartial', score: @score
  json.partial! 'score_partial.json.jbuilder', score: score
end
