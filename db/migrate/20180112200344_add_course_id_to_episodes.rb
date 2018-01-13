class AddCourseIdToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :course_id, :integer
  end
end
