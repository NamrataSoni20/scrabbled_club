class Player < ApplicationRecord
  has_many :games, dependent: :destroy
  has_one :winner, class_name: "Player", foreign_key: "winner_id"
  has_one :loser, class_name: "Player", foreign_key: "loser_id"

  def full_name
    "#{first_name} #{last_name}"
  end

end
