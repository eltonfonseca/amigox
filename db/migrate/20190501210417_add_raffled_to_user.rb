class AddRaffledToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :raffled, foreign_key: true
  end
end
