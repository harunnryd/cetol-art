class AddDescToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :desc, :text
  end
end
