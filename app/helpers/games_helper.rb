module GamesHelper
  def player_full_name(player_id)
    player = Player.find_by_id(player_id)
    player.full_name if player.present?
  end
end
