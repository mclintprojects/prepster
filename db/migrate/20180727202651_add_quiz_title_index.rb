class AddQuizTitleIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :quizzes, :title
  end
end
