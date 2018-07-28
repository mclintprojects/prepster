class AddDefaultQuizSession < ActiveRecord::Migration[5.2]
  def change
    change_column :quizzes, :sessions, :integer, using: 'sessions::integer'
  end
end
