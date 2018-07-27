class AddDefaultQuizSession < ActiveRecord::Migration[5.2]
  def change
    change_column_default :quizzes, :sessions, 0
  end
end
