class AddFlagToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :id_created, :integer
  end
end
