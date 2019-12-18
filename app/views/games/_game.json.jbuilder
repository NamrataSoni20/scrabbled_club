json.extract! game, :id, :winner_id, :loser_id, :winner_score, :loser_score, :created_at, :updated_at
json.url game_url(game, format: :json)
