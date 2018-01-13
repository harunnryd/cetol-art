class AddSlugToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :slug, :string
  end
end
