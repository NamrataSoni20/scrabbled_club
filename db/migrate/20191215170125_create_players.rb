class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.date :joining_date
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end
