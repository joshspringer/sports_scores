class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.string :home_team
      t.integer :home_team_score
      t.string :away_team
      t.integer :away_team_score
      t.date :date

      t.timestamps
    end
  end
end
