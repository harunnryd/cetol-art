class AddUserIdToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :user_id, :integer
  end
end
