class AddDefaultQuizSession < ActiveRecord::Migration[5.2]
  def change
    change_column :quizzes, :sessions, 'numeric USING CAST(sessions AS numeric)', default: 0
  end
end
