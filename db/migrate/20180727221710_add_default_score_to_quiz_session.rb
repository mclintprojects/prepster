class AddDefaultScoreToQuizSession < ActiveRecord::Migration[5.2]
  def change
    change_column_default :quiz_sessions, :score, 0
  end
end
