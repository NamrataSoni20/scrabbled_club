module PlayersHelper
  def games_played_by_player(player_id)
    Game.where("winner_id = ? or loser_id = ?", player_id, player_id)
  end

  def no_of_wins(player_id)
    Game.where(winner_id: player_id).count
  end

  def no_of_losses(player_id)
    Game.where(loser_id: player_id).count
  end

  def average_score(player_id)
    winning_score = games_played_by_player(player_id).pluck(:winner_score)
    losing_score = games_played_by_player(player_id).pluck(:loser_score)
    total_score = winning_score + losing_score
    average_score = (total_score.inject(:+))/(total_score.count) if total_score.present?
    return average_score || 0
  end

  def hieghest_score(player_id)
    highest_winning_score = games_played_by_player(player_id).max_by(&:winner_score)
    highest_winning_score_details = (highest_winning_score.class == Array ?  highest_winning_score.first : highest_winning_score)
  end

  def get_opponent_name(game, pid)
    if game.winner_id == pid
       opp = game.loser_id
    else
      opp = game.winner_id
    end
    player_full_name(opp)
  end
end
