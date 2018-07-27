class AlterQuizSessions < ActiveRecord::Migration[5.2]
  def change
    change_column :quizzes, :sessions, :integer, default: 0
  end
end
