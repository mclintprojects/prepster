class AlterQuizSessions < ActiveRecord::Migration[5.2]
  def change
    change_column :quizzes, :sessions, 'integer USING CAST(column_name AS integer)'
  end
end
